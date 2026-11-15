import csv,datetime,json,pathlib,random,statistics,subprocess,sys,time

root=pathlib.Path(__file__).resolve().parent
stamp=datetime.datetime.now(datetime.timezone.utc).strftime('%Y%m%dT%H%M%SZ')
out=root/'results'/('cleanup-'+stamp)
out.mkdir()
def capture(cmd):
    p=subprocess.run(cmd,text=True,capture_output=True)
    if p.returncode:raise RuntimeError(p.stderr)
    return p.stdout.strip()
metadata=json.loads((root/'results/libressl-provenance.json').read_text())
metadata.update(chip=capture(['/usr/sbin/sysctl','-n','machdep.cpu.brand_string']),
                macos=capture(['/usr/bin/sw_vers']),compiler=capture(['/usr/bin/clang','--version']),
                power=capture(['/usr/bin/pmset','-g','custom']),
                thermal_before=capture(['/usr/bin/pmset','-g','therm']),
                utc=stamp,pairs=5,mib=512)
assert metadata['chip']=='Apple M1 Max'
(out/'metadata.json').write_text(json.dumps(metadata,indent=2)+'\n')
def transfer(build,server=None,compressed=False,legacy=False,download=False,compat=False,round=0):
    cmd=[sys.executable,str(root/'scripts/bench.py'),'--build',build,
         '--cipher','chacha20-poly1305@openssh.com','--mib','16' if compat else '512',
         '--corpus','text' if compat else 'random','--repeat','1',
         '--phase','cleanup-compat' if compat else ('cleanup-warmup' if round==0 else 'cleanup-measured'),
         '--round',str(round)]
    if server:cmd+=['--server-build',server]
    if compressed:cmd+=['--compression']
    if legacy:cmd+=['--legacy']
    if download:cmd+=['--download']
    if compat:cmd+=['--rekey-limit','1M']
    p=subprocess.run(cmd,text=True,capture_output=True)
    if p.returncode:raise RuntimeError(p.stdout+p.stderr)
    rows=[json.loads(x) for x in p.stdout.splitlines() if x.startswith('{')]
    assert len(rows)==1
    return rows[0]
with (out/'compatibility.jsonl').open('w') as f:
    for peer in ['system','apple-libressl']:
        for client,server in [('apple-libressl-neon',peer),(peer,'apple-libressl-neon')]:
            for compressed in [False,True]:
                for legacy in [False,True]:
                    for download in [False,True]:
                        row=transfer(client,server,compressed,legacy,download,compat=True)
                        f.write(json.dumps(row)+'\n');f.flush()
print('PASS 32 compatibility transfers, both directions/compression/protocols/rekey',flush=True)
subprocess.run(['/usr/bin/clang','-O2',str(root/'scripts/bench_libressl_pair.c'),'-o',str(root/'experiment/bench_pair')],check=True)
print('Cooling down for 60 seconds before primitive retiming',flush=True)
time.sleep(60)
with (out/'primitive.jsonl').open('w') as f:
    subprocess.run([str(root/'experiment/bench_pair'),str(root/'builds/libressl-current/install/lib/libcrypto.57.dylib'),str(root/'builds/libressl-neon/install/lib/libcrypto.57.dylib'),'5'],stdout=f,check=True)
print('Cooling down for 60 seconds before SCP retiming',flush=True)
time.sleep(60)
records=[]
with (out/'scp.jsonl').open('w') as f:
    for round in range(6):
        builds=['apple-libressl','apple-libressl-neon']
        if round%2:builds.reverse()
        for build in builds:
            row=transfer(build,round=round);records.append(row)
            f.write(json.dumps(row)+'\n');f.flush()
            print('round',round,build,'cpu',row['cpu'],'wall',row['wall'],flush=True)
        time.sleep(2)
summary=[]
for build in ['apple-libressl','apple-libressl-neon']:
    group=[r for r in records if r['phase']=='cleanup-measured' and r['build']==build]
    assert len(group)==5
    summary.append(dict(build=build,n=5,cpu=statistics.median(r['cpu'] for r in group),wall=statistics.median(r['wall'] for r in group),
                        cpu_min=min(r['cpu'] for r in group),cpu_max=max(r['cpu'] for r in group),
                        wall_min=min(r['wall'] for r in group),wall_max=max(r['wall'] for r in group)))
base=summary[0]
for r in summary:
    r['cpu_saved_pct']=100*(1-r['cpu']/base['cpu']);r['wall_saved_pct']=100*(1-r['wall']/base['wall'])
with (out/'summary.csv').open('w',newline='') as f:
    w=csv.DictWriter(f,fieldnames=list(summary[0]),lineterminator='\n');w.writeheader();w.writerows(summary)
metadata['thermal_after']=capture(['/usr/bin/pmset','-g','therm'])
(out/'metadata.json').write_text(json.dumps(metadata,indent=2)+'\n')
print(json.dumps(summary,indent=2),flush=True)
print('RESULTS',out,flush=True)
