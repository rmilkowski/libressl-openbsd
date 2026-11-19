#!/usr/bin/env python3
"""Check every sample and calculate within-round differences for the three builds."""
import collections
import csv
import itertools
import json
import pathlib
import statistics
import sys

root=pathlib.Path(sys.argv[1])
labels=("scalar","reviewed","refined")
sizes={4,32,64,128,191,192,193,224,255,256,257,448,449,511,512,4096,32768,131072}
def lines(p):
    return [json.loads(line) for line in (root/p).read_text().splitlines()]
def summarize(name, records, n, conds):
    group=collections.defaultdict(dict)
    orders=collections.defaultdict(list)
    for rd,cond,variant,unit,cpu,wall in records:
        assert variant in labels and rd in range(n+1) and cond in conds
        assert unit>0 and cpu>0 and wall>0
        key=(cond,rd)
        assert variant not in group[key]
        group[key][variant]=(unit,cpu,wall)
        orders[key].append(variant)
    assert len(group)==len(conds)*(n+1)
    output=[]
    for cond in sorted(conds):
        seen=collections.Counter(tuple(orders[cond,i]) for i in range(1,n+1))
        assert len(seen)==6 and all(v==n//6 for v in seen.values()), (name,cond,seen)
        for rd in range(n+1):
            vals=group[cond,rd]
            assert set(vals)==set(labels) and len(set(x[0] for x in vals.values()))==1
        fields={"series":name,"condition":cond,"rounds":n}
        for metric,idx in (("cpu",1),("wall",2)):
            for label in labels:
                v=[group[cond,rd][label][idx]/group[cond,rd][label][0] for rd in range(1,n+1)]
                for suffix,stat in (("median",statistics.median),("min",min),("max",max)):
                    fields[f"{metric}_{label}_{suffix}"]=stat(v)
            for ref in labels[:2]:
                v=[100*(1-group[cond,rd]["refined"][idx]/group[cond,rd][ref][idx]) for rd in range(1,n+1)]
                for suffix,stat in (("median",statistics.median),("min",min),("max",max)):
                    fields[f"{metric}_saved_vs_{ref}_{suffix}"]=stat(v)
        output.append(fields)
    return output
def transfer_rows(rows):
    by_corpus={}
    for row in rows:
        assert row['bytes']==536870912 and row['direction']=='upload'
        assert row['cipher']=='chacha20-poly1305@openssh.com'
        assert row['phase']==('warmup' if row['round']==0 else 'measured')
        assert row['server_status'] in ([0],[255]) and abs(row['cpu']-row['user']-row['system'])<1e-8
        assert by_corpus.setdefault(row['corpus'],row['sha256'])==row['sha256']
        yield (row['round'],('SCP' if row['legacy'] else 'SFTP')+' '+row['corpus']+
               (' compressed' if row['compression'] else ' uncompressed'),row['variant'],1,row['cpu'],row['wall'])
primitive=lines("primitive-confirmation.jsonl")
assert all(r['warmup']==(r['round']==0) for r in primitive)
data=summarize("M3 EVP",[(r['round'],r['size'],r['backend'],r['iterations'],r['cpu'],r['wall']) for r in primitive],12,sizes)
for arch in ("arm64","x86_64"):
    with (root/f"hosted-{arch}.csv").open() as f:hosted=list(csv.DictReader(f))
    data.extend(summarize("Linux "+arch+" ChaCha",[(int(r['round']),int(r['size']),r['backend'],int(r['iterations']),float(r['cpu']),float(r['wall'])) for r in hosted],12,sizes))
pilot=lines("sftp-confirmation.jsonl")
assert all(row["sha256"] == json.loads((root/"timing-environment.json").read_text())["sftp"]["sha256"] for row in pilot)
data.extend(summarize("M3 SFTP confirmation",transfer_rows(pilot),6,{"SFTP random uncompressed"}))
matrix=lines("matrix-confirmation.jsonl")
corpora=json.loads((root/"matrix-environment.json").read_text())["corpora_sha256"]
assert all(row["sha256"]==corpora[row["corpus"]] for row in matrix)
conditions={proto+' '+c for proto in ('SFTP','SCP') for c in ('random uncompressed','random compressed','text compressed')}
data.extend(summarize("M3 full matrix",transfer_rows(matrix),6,conditions))
assert len(primitive)==702 and len(pilot)==21 and len(matrix)==126 and len(data)==61
with (root/"summary.csv").open("w") as f:
    out=csv.DictWriter(f,data[0],lineterminator="\n")
    out.writeheader()
    out.writerows(data)
print("Verified 702 M3 EVP records, 702 hosted records per machine, 21 SFTP confirmation transfers, 126 full-matrix transfers, and all variant orderings.")
