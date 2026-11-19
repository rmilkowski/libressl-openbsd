#!/usr/bin/env python3
"""Sequential loopback SCP; aggregate waited child CPU for both endpoints."""
import argparse, hashlib, json, os, pathlib, resource, socket, subprocess, threading, time
import shlex, pwd

ROOT = pathlib.Path(__file__).resolve().parents[1]
ap = argparse.ArgumentParser()
ap.add_argument('--build', default='baseline')
ap.add_argument('--cipher', default='default')
ap.add_argument('--compression', action='store_true')
ap.add_argument('--legacy', action='store_true')
ap.add_argument('--repeat', type=int, default=3)
ap.add_argument('--mib', type=int, default=256)
ap.add_argument('--corpus', choices=['random', 'text'], default='random')
ap.add_argument('--server-build')
ap.add_argument('--phase', default='manual')
ap.add_argument('--round', type=int, default=0)
ap.add_argument('--profile', action='store_true')
ap.add_argument('--download', action='store_true')
ap.add_argument('--rekey-limit')
a = ap.parse_args()
b = ROOT / 'builds' / a.build
server = ROOT / 'builds' / (a.server_build or a.build)
run = ROOT / 'experiment'
run.mkdir(exist_ok=True)
key = run / 'id_ed25519'
if not key.exists():
    subprocess.run([str(b/'ssh-keygen'), '-q', '-t', 'ed25519', '-N', '', '-f', str(key)], check=True)
auth = run/'authorized_keys'
auth.write_bytes(key.with_suffix('.pub').read_bytes())
auth.chmod(0o600)
source = run/f'{a.corpus}-{a.mib}.bin'
if not source.exists():
    with source.open('wb') as f:
        for i in range(a.mib):
            if a.corpus == 'random':
                block = os.urandom(1024*1024)
            else:
                # Structured log-like records, varying fields, realistic redundancy.
                lines = [f'2026-11-14T10:{j%60:02d}:{i%60:02d} host=mac service=transfer request={i*10000+j} status=200 bytes={j*71} path=/data/project/{j%193}/file.json\n'.encode() for j in range(10000)]
                block = b''.join(lines)[:1024*1024]
                block = (block*2)[:1024*1024]
            f.write(block)
def sha256_file(path):
    digest = hashlib.sha256()
    with path.open('rb') as stream:
        for block in iter(lambda: stream.read(1024 * 1024), b''):
            digest.update(block)
    return digest.hexdigest()
expected = sha256_file(source)
dest = run/'received.bin'
config = run/'sshd_config'
config.write_text(f'''HostKey "{key}"
AuthorizedKeysFile "{auth}"
StrictModes no
PasswordAuthentication no
KbdInteractiveAuthentication no
UseDNS no
PidFile "{run}/sshd.pid"
Subsystem sftp "{server}/sftp-server"
SetEnv "PATH={server}:/usr/bin:/bin:/usr/sbin:/sbin"
LogLevel VERBOSE
''')
for repeat in range(a.repeat):
    listener = socket.socket()
    listener.bind(('127.0.0.1', 0))
    listener.listen(1)
    port = listener.getsockname()[1]
    errors = []
    server_status = []
    def serve():
        try:
            listener.settimeout(30)
            conn, _ = listener.accept()
            with conn, (run/'server.log').open('wb') as log:
                p = subprocess.Popen([str(server/'sshd'), '-i', '-e', '-f', str(config)], stdin=conn, stdout=conn, stderr=log)
                status = p.wait(timeout=180)
                server_status.append(status)
                log_text = (run/'server.log').read_text()
                # OpenSSH's server session exits 255 for SSH_MSG_DISCONNECT,
                # including a successful scp client's normal disconnect.
                if status != 0 and not (status == 255 and 'disconnected by user' in log_text):
                    errors.append(f'sshd failed ({status}): '+log_text)
        except Exception as e:
            errors.append(str(e))
    before = resource.getrusage(resource.RUSAGE_CHILDREN)
    thread = threading.Thread(target=serve)
    thread.start()
    cmd = [str(b/'scp'), '-q', '-S', str(b/'ssh'), '-F', '/dev/null', '-P', str(port), '-i', str(key), '-oBatchMode=yes', '-oStrictHostKeyChecking=no', '-oUserKnownHostsFile=/dev/null', '-oIdentitiesOnly=yes']
    if a.cipher != 'default': cmd += ['-c', a.cipher]
    if a.rekey_limit: cmd += ['-oRekeyLimit='+a.rekey_limit]
    if a.compression: cmd += ['-C']
    if a.legacy: cmd += ['-O']
    # Legacy protocol executes scp via the server's shell PATH.
    remote_dest = shlex.quote(str(dest)) if a.legacy else str(dest)
    userhost = f'{pwd.getpwuid(os.getuid()).pw_name}@127.0.0.1:'
    if a.download:
        remote_source = shlex.quote(str(source)) if a.legacy else str(source)
        cmd += [userhost+remote_source, str(dest)]
    else:
        cmd += [str(source), userhost+remote_dest]
    start = time.perf_counter()
    if a.profile:
        child = subprocess.Popen(cmd, stdout=subprocess.PIPE, stderr=subprocess.PIPE, env={**os.environ, 'PATH':str(server)+':'+os.environ['PATH']})
        time.sleep(.2)
        processes = subprocess.check_output(['ps','-axo','pid=,ppid=,comm='],text=True)
        for line in processes.splitlines():
            pid, ppid, name = line.strip().split(None,2)
            if int(ppid)==child.pid and name.endswith('/ssh'):
                subprocess.run(['/usr/bin/sample',pid,'2','1','-file',str(ROOT/'results'/f'profile-{a.build}-{a.corpus}.txt')],stdout=subprocess.DEVNULL,stderr=subprocess.DEVNULL)
        out, err = child.communicate(timeout=180)
        p = subprocess.CompletedProcess(cmd, child.returncode, out, err)
    else:
        p = subprocess.run(cmd, capture_output=True, timeout=180, env={**os.environ, 'PATH':str(server)+':'+os.environ['PATH']})
    thread.join(timeout=190)
    elapsed = time.perf_counter()-start
    listener.close()
    after = resource.getrusage(resource.RUSAGE_CHILDREN)
    if p.returncode or errors:
        raise RuntimeError(p.stderr.decode()+str(errors))
    actual = sha256_file(dest)
    assert actual == expected, 'SHA256 mismatch'
    user = after.ru_utime-before.ru_utime
    system = after.ru_stime-before.ru_stime
    row = dict(build=a.build, server_build=a.server_build or a.build, cipher=a.cipher, compression=a.compression, legacy=a.legacy, direction='download' if a.download else 'upload', corpus=a.corpus, bytes=source.stat().st_size, repeat=repeat, round=a.round, phase=a.phase, rekey_limit=a.rekey_limit, wall=elapsed, user=user, system=system, cpu=user+system, cpu_percent=100*(user+system)/elapsed, mib_s=a.mib/elapsed, sha256=actual, server_status=server_status)
    print(json.dumps(row), flush=True)
    with (ROOT/'results'/'transfers.jsonl').open('a') as f: f.write(json.dumps(row)+'\n')
