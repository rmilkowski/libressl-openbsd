#!/usr/bin/env python3
"""Repeat the documented six transfers with all three source versions."""
import datetime
import hashlib
import itertools
import json
import os
from pathlib import Path
import random
import subprocess
import sys
import time

root=Path(__file__).resolve().parent
os.chdir(root)
results=root/"results"
builds={"scalar":"apple-libressl","reviewed":"apple-libressl-prior","refined":"apple-libressl-refined"}
labels=list(builds)
orders=[(0,1,2),(1,2,0),(2,0,1),(2,1,0),(1,0,2),(0,2,1)]
assert set(orders)==set(itertools.permutations(range(3)))
conditions=[(legacy, corpus, compression) for legacy in (False,True)
    for corpus,compression in (("random",False),("random",True),("text",True))]
def cmd(args):
    return subprocess.check_output(args,text=True,stderr=subprocess.STDOUT).strip()
def observation():
    return {"utc":datetime.datetime.now(datetime.timezone.utc).isoformat(),
        "power":cmd(["/usr/bin/pmset","-g","batt"]).splitlines()[0],
        "thermal":cmd(["/usr/bin/pmset","-g","therm"]),
        "load":os.getloadavg()}
def persist():
    (results/"matrix-environment.json").write_text(json.dumps(meta,indent=2)+"\n")
def check_ready():
    for n in ("scalar","reviewed","refined"):
        log=(results/("check-"+n+".log")).read_text()
        assert "# PASS:  145" in log and "# FAIL:  0" in log and "# ERROR: 0" in log
meta={"machine":cmd(["/usr/sbin/sysctl","-n","machdep.cpu.brand_string"]),
    "start":observation(),"mode":[s.strip() for s in cmd(["/usr/bin/pmset","-g","custom"]).splitlines() if "lowpowermode" in s or "powermode" in s or "AC Power" in s],
    "round_starts":[],"seed":20261119,"corpora_sha256":{}}
assert meta["machine"]=="Apple M3" and "AC Power" in meta["start"]["power"]
check_ready()
base=[sys.executable,str(root/"scripts/bench.py"),"--cipher","chacha20-poly1305@openssh.com","--mib","512"]
for corpus in ("random","text"):
    cmd([*base,"--build",builds["scalar"],"--corpus",corpus,"--repeat","0"])
    src=root/"experiment"/(corpus+"-512.bin")
    assert src.stat().st_size==512*1024*1024
    with src.open("rb") as source:
        meta["corpora_sha256"][corpus]=hashlib.file_digest(source,"sha256").hexdigest()
persist()
time.sleep(60)
with (results/"matrix-confirmation.jsonl").open("x") as f:
    for rnd in range(7):
        phase="measured" if rnd else "warmup"
        meta["round_starts"].append(observation())
        assert "AC Power" in meta["round_starts"][-1]["power"]
        persist()
        seq=list(range(6))
        random.Random(meta["seed"]+rnd).shuffle(seq)
        for idx in seq:
            legacy,corpus,compress=conditions[idx]
            # Each condition sees all six variant orders across the six rounds.
            order=orders[(idx+max(0,rnd-1))%6]
            for b in order:
                variant=labels[b]
                args=[*base,"--build",builds[variant],"--corpus",corpus,"--repeat","1",
                    "--phase",phase,"--round",str(rnd)]
                if legacy:args.append("--legacy")
                if compress:args.append("--compression")
                raw=json.loads(cmd(args))
                assert raw["sha256"]==meta["corpora_sha256"][corpus] and raw["bytes"]==512*1024*1024
                raw["variant"]=variant
                f.write(json.dumps(raw)+"\n")
                f.flush()
            print(f"Finished {phase} {rnd} condition {idx+1}/6",flush=True)
            time.sleep(2)
meta["finish"]=observation()
persist()
