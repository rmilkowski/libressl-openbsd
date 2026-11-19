#!/usr/bin/env python3
"""Run the full-library EVP comparison and balanced loopback confirmation in order."""
import datetime
import hashlib
import itertools
import json
import os
from pathlib import Path
import platform
import subprocess
import sys
import time

root = Path(__file__).resolve().parent
os.chdir(root)
results = root / "results"
repo = Path(sys.argv[1])
variants = {"scalar": ("current", ""), "reviewed": ("prior", "-prior"), "refined": ("refined", "-refined")}
def command(args):
    return subprocess.check_output(args, text=True, stderr=subprocess.STDOUT).strip()
def digest(path):
    with Path(path).open("rb") as f:
        return hashlib.file_digest(f, "sha256").hexdigest()
def utc():
    return datetime.datetime.now(datetime.timezone.utc).isoformat()
def conditions():
    return {"utc":utc(), "power":command(["/usr/bin/pmset","-g","batt"]).splitlines()[0],
        "thermal":command(["/usr/bin/pmset","-g","therm"]),"load":os.getloadavg()}
def write_metadata():
    (results/"timing-environment.json").write_text(json.dumps(meta, indent=2) + "\n")

meta = {"candidate":command(["git","-C",str(repo),"rev-parse","HEAD"]),
    "base":command(["git","-C",str(repo),"rev-parse","libressl/master"]),
    "prior":command(["git","-C",str(repo),"rev-parse","origin/upstream/chacha-aarch64-neon"]),
    "machine":command(["/usr/sbin/sysctl","-n","machdep.cpu.brand_string"]),
    "model":command(["/usr/sbin/sysctl","-n","hw.model"]),
    "memory_bytes":command(["/usr/sbin/sysctl","-n","hw.memsize"]),
    "macos":command(["/usr/bin/sw_vers"]), "architecture":platform.machine(),
    "compiler":command(["/usr/bin/clang","--version"]),
    "sources_sha256":{n:digest(n) for n in ("libressl-4.4.1.tar.gz","apple-openssh.tar.gz")},
    "variants":{}, "start":conditions()}
assert meta["candidate"] == "e904cc1ba13ecac94d9941311f5edf7e43a3c433"
assert meta["machine"] == "Apple M3" and "AC Power" in meta["start"]["power"], meta["start"]
lib_paths = []
for label,(lib_suffix,ssh_suffix) in variants.items():
    lib = root / "builds" / ("libressl-" + lib_suffix) / "install/lib/libcrypto.57.dylib"
    ssh = root / "builds" / ("apple-libressl" + ssh_suffix)
    lib_paths.append(str(lib))
    for name in ("ssh", "sshd-session"):
        assert str(lib) in command(["/usr/bin/otool","-L",str(ssh/name)])
    assert "#define HAVE_EVP_CHACHA20 1" in (ssh/"config.h").read_text()
    meta["variants"][label] = {"libcrypto_sha256":digest(lib), "ssh_sha256":digest(ssh/"ssh"),
        "ssh_version":command([str(ssh/"ssh"),"-V"]), "library":lib.name,
        "linked_ssh_and_sshd_session":True}
meta["evp"] = {"measured_rounds":12,"warmup_rounds":1,"max_bytes_per_case":64*1024*1024,
                "max_iterations":500_000, "all_six_orders_twice":True}
meta["sftp"] = {"measured_rounds":6,"warmup_rounds":1, "mib":512,
    "corpus":"random","compression":False,"direction":"upload","all_six_orders_once":True}
write_metadata()
print("Cooling down before EVP", flush=True)
time.sleep(60)
meta["before_evp"] = conditions()
write_metadata()
with (results/"primitive-confirmation.jsonl").open("x") as out:
    subprocess.run([str(root/"bench-three"),*lib_paths,"12"], stdout=out, check=True)
print("EVP complete", flush=True)
meta["after_evp"] = conditions()
write_metadata()
# Prepare file and digest outside timings, before the cooldown.
corpus = root/"experiment/random-512.bin"
if not corpus.exists():
    with corpus.open("xb") as f:
        for _ in range(512):
            f.write(os.urandom(1024*1024))
assert corpus.stat().st_size == 512*1024*1024
meta["sftp"]["sha256"] = digest(corpus)
write_metadata()
time.sleep(60)
meta["before_sftp"] = conditions()
write_metadata()
labels = ("scalar","reviewed","refined")
orders = [(0,1,2), (1,2,0), (2,0,1), (2,1,0), (1,0,2), (0,2,1)]
assert set(orders) == set(itertools.permutations(range(3)))
with (results/"sftp-confirmation.jsonl").open("x") as out:
    for rd,order in enumerate([orders[0], *orders]):
        phase = "warmup" if rd == 0 else "measured"
        for index in order:
            label = labels[index]
            build = "apple-libressl" + variants[label][1]
            cmd = [sys.executable, str(root/"scripts/bench.py"), "--build",build,
                "--cipher","chacha20-poly1305@openssh.com","--mib","512","--corpus",
                "random","--repeat","1","--round",str(rd),"--phase",phase]
            row = json.loads(command(cmd))
            assert row["sha256"] == meta["sftp"]["sha256"] and row["bytes"] == 512*1024*1024
            row["variant"] = label
            out.write(json.dumps(row) + "\n")
            out.flush()
            print(f"SFTP {phase} {rd} {label} CPU {row['cpu']:.3f}s wall {row['wall']:.3f}s", flush=True)
        time.sleep(2)
meta["finish"] = conditions()
write_metadata()
