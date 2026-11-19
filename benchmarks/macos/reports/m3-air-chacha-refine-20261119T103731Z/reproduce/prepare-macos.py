#!/usr/bin/env python3
"""Prepare three LibreSSL 4.4.1 builds and matching Apple OpenSSH clients for the recorded comparison."""
import hashlib
import os
from pathlib import Path
import shutil
import subprocess
import sys
import tempfile

bundle = Path(__file__).resolve().parent
repo = Path(sys.argv[1]).resolve()
lab = Path(sys.argv[2]).resolve()
base = "1a8bfb53bc7034a8f877875aa833a8c3c10b8731"
reviewed = "3078483bccfd1bd4fb6f313950e0f3daae484e5c"
refined = "e904cc1ba13ecac94d9941311f5edf7e43a3c433"
tools_revision = "0ad357b80c10af3910eca6ba974db73771eac418"
apple = "2cc66abd7f8f1eb27d6a3074e476514194efe07e"
def git(*args):
    return subprocess.check_output(["git", "-C", repo, *args])
def show(revision, path):
    return git("show", revision + ":" + path)
def sha(path):
    with path.open("rb") as src:
        return hashlib.file_digest(src, "sha256").hexdigest()
def run(args, work, env=None, log=None):
    if log:
        with (lab/"results"/log).open("w") as out:
            subprocess.run(args, cwd=work, env=env, stdout=out, stderr=subprocess.STDOUT, check=True)
    else:
        subprocess.run(args, cwd=work, env=env, check=True)
def extract(archive, dest):
    dest.parent.mkdir(parents=True, exist_ok=True)
    with tempfile.TemporaryDirectory(dir=dest.parent) as tmp:
        subprocess.run(["/usr/bin/tar", "-xzf", archive, "-C", tmp], check=True)
        [tree] = Path(tmp).iterdir()
        tree.rename(dest)

if git("rev-parse", "HEAD").decode().strip() != refined:
    sys.exit("Check out the source candidate specified in REPRODUCE.md")
lab.mkdir(parents=True, exist_ok=True)
if list(lab.iterdir()) or " " in str(lab):
    sys.exit("Use a fresh working directory with a space-free path")
for folder in ("scripts", "results", "experiment", "builds"):
    (lab/folder).mkdir()
archives = [
    ("libressl-4.4.1.tar.gz", "https://cdn.openbsd.org/pub/OpenBSD/LibreSSL/libressl-4.4.1.tar.gz",
     "290cdf1b53c086255dc302f118b98602a444e9ae6d11e9bfdd8c9b1b60aa3a22"),
    ("apple-openssh.tar.gz", "https://codeload.github.com/apple-oss-distributions/OpenSSH/tar.gz/" + apple,
     "2cbfcd422269aa5630bed2da618f6416b53fce326ad575fdd37ba75c095f3490"),
]
for name, url, expected in archives:
    path = lab/name
    run(["/usr/bin/curl", "--fail", "--location", "--silent", "--show-error", "--output", path, url], lab)
    if sha(path) != expected:
        sys.exit(f"Archive checksum mismatch for {name}")
for name in ("run-timing.py", "run-matrix.py", "bench-three.c"):
    shutil.copyfile(bundle/name, lab/name)
for name in ("bench.py", "build_apple_ssh.sh"):
    shutil.copyfile(bundle/name, lab/"scripts"/name)
extract(lab/"apple-openssh.tar.gz", lab/"apple-openssh")
patch = lab/"apple-public-sdk.patch"
patch.write_bytes(show(tools_revision, "benchmarks/macos/apple-public-sdk.patch"))
run(["/usr/bin/patch", "-p1", "-i", patch], lab/"apple-openssh")
env = dict(os.environ, CC="/usr/bin/clang", CXX="/usr/bin/clang++", lt_cv_sys_max_cmd_len="262144",
           SSH_PERF_ROOT=str(lab), SSH_PERF_JOBS="4")
variants = [("scalar", "current", "", base), ("reviewed", "prior", "-prior", reviewed),
            ("refined", "refined", "-refined", refined)]
for label, suffix, ssh_suffix, commit in variants:
    src = lab/("src-" + label)
    build = lab/("out-" + label)
    prefix = lab/"builds"/("libressl-" + suffix)/"install"
    extract(lab/"libressl-4.4.1.tar.gz", src)
    tu = "src/lib/libcrypto/chacha/chacha-merged.c"
    source = src/"crypto/chacha/chacha-merged.c"
    if source.read_bytes() != show(base, tu):
        sys.exit("The stock release ChaCha implementation differs from the upstream base")
    source.write_bytes(show(commit, tu))
    (src/"tests/chachatest.c").write_bytes(show(refined if label == "refined" else reviewed,
                                               "src/regress/lib/libcrypto/chacha/chachatest.c"))
    build.mkdir()
    run([src/"configure", "--prefix="+str(prefix), "--enable-shared", "CFLAGS=-O2 -g"], build, env, "configure-"+label+".log")
    run(["make","-j6"], build, env, "build-"+label+".log")
    run(["make","install"], build, env, "install-"+label+".log")
    run(["make","-j4","check"], build, env, "check-"+label+".log")
    run(["/bin/sh",lab/"scripts/build_apple_ssh.sh","apple-libressl"+ssh_suffix], lab, env)
run(["/usr/bin/clang","-O2","-Wall","-Wextra","-Werror","bench-three.c","-o","bench-three"], lab)
