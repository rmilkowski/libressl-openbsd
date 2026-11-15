#!/usr/bin/env python3
"""Prepare pinned public sources, run the native Mac benchmark, and retain reports."""
import argparse
import difflib
import hashlib
import json
import os
import pathlib
import platform
import shutil
import subprocess
import sys
import tarfile
import tempfile

HERE = pathlib.Path(__file__).resolve().parent
REPO = HERE.parents[1]
CHACHA = pathlib.Path('src/lib/libcrypto/chacha/chacha-merged.c')
LIBRESSL_URL = 'https://cdn.openbsd.org/pub/OpenBSD/LibreSSL/libressl-4.4.1.tar.gz'
LIBRESSL_SHA256 = '290cdf1b53c086255dc302f118b98602a444e9ae6d11e9bfdd8c9b1b60aa3a22'
BASE_CHACHA_SHA256 = 'e728668de5d144b2150f2224bb1482fd3047c973e16289cfe6681c3202ea185e'
APPLE_COMMIT = '2cc66abd7f8f1eb27d6a3074e476514194efe07e'
APPLE_URL = 'https://codeload.github.com/apple-oss-distributions/OpenSSH/tar.gz/' + APPLE_COMMIT
APPLE_SHA256 = '2cbfcd422269aa5630bed2da618f6416b53fce326ad575fdd37ba75c095f3490'


def sha256(path):
    value = hashlib.sha256()
    with path.open('rb') as stream:
        for block in iter(lambda: stream.read(1024 * 1024), b''):
            value.update(block)
    return value.hexdigest()


def output(command):
    return subprocess.check_output(command, text=True).strip()


def download(work, filename, url, expected):
    path = work / 'downloads' / filename
    path.parent.mkdir(exist_ok=True)
    if not path.exists():
        print('Downloading pinned public source:', url, flush=True)
        temporary = path.with_suffix(path.suffix + '.partial')
        subprocess.run(['/usr/bin/curl', '--fail', '--location', '--retry', '2',
                        '--silent', '--show-error', url, '-o', str(temporary)], check=True)
        if sha256(temporary) != expected:
            raise RuntimeError('Downloaded archive hash mismatch: ' + str(temporary))
        temporary.rename(path)
    if sha256(path) != expected:
        raise RuntimeError('Cached archive hash mismatch: ' + str(path))
    return path


def unpack(archive, destination):
    if destination.exists():
        return
    # Both pinned archives contain only regular files and directories. Reject links
    # and traversal rather than requiring Python 3.12's tar extraction filter.
    with tempfile.TemporaryDirectory(dir=destination.parent, prefix='extract-') as staging:
        staging = pathlib.Path(staging)
        with tarfile.open(archive, 'r:gz') as stream:
            for member in stream.getmembers():
                path = pathlib.PurePosixPath(member.name)
                if path.is_absolute() or '..' in path.parts or not (member.isfile() or member.isdir()):
                    raise RuntimeError('Unsupported archive entry: ' + member.name)
                target = staging.joinpath(*path.parts)
                if member.isdir():
                    target.mkdir(parents=True, exist_ok=True)
                else:
                    target.parent.mkdir(parents=True, exist_ok=True)
                    with stream.extractfile(member) as source, target.open('wb') as output_stream:
                        shutil.copyfileobj(source, output_stream)
                    target.chmod(member.mode & 0o777)
                    os.utime(target, (member.mtime, member.mtime))
        roots = list(staging.iterdir())
        if len(roots) != 1 or not roots[0].is_dir():
            raise RuntimeError('Expected one archive root directory')
        roots[0].rename(destination)


def prepare(work):
    work.mkdir(parents=True, exist_ok=True)
    (work / 'results').mkdir(exist_ok=True)
    release = download(work, 'libressl-4.4.1.tar.gz', LIBRESSL_URL, LIBRESSL_SHA256)
    apple = download(work, 'apple-openssh.tar.gz', APPLE_URL, APPLE_SHA256)
    unpack(release, work / 'libressl-portable')
    unpack(apple, work / 'apple-openssh')
    baseline = work / 'libressl-portable/crypto/chacha/chacha-merged.c'
    changed = REPO / CHACHA
    if sha256(baseline) != BASE_CHACHA_SHA256:
        raise RuntimeError('Baseline ChaCha source does not match the M1 Max experiment')
    if sha256(changed) == BASE_CHACHA_SHA256:
        raise RuntimeError('Check out the patched experiment branch; ChaCha source is unchanged')
    candidate = work / 'libressl-neon'
    if candidate.exists():
        if sha256(candidate / 'crypto/chacha/chacha-merged.c') != sha256(changed):
            raise RuntimeError('Working source differs from this branch. Use a fresh --work-dir and rebuild.')
    else:
        shutil.copytree(work / 'libressl-portable', candidate)
        shutil.copy2(changed, candidate / 'crypto/chacha/chacha-merged.c')
    patch = ''.join(difflib.unified_diff(baseline.read_text().splitlines(True), changed.read_text().splitlines(True),
                                       fromfile='a/crypto/chacha/chacha-merged.c',
                                       tofile='b/crypto/chacha/chacha-merged.c'))
    (work / 'results/libressl-441-neon-portable.patch').write_text(patch)
    ssh_source = work / 'apple-openssh/openssh/ssh.c'
    if '#define APPLE_SI_COMPARE_AVAILABLE 1' not in ssh_source.read_text():
        subprocess.run(['/usr/bin/patch', '-p1', '-i', str(HERE / 'apple-public-sdk.patch')],
                       cwd=work / 'apple-openssh', check=True)
    scripts = work / 'scripts'
    scripts.mkdir(exist_ok=True)
    for path in (HERE / 'tools').iterdir():
        if path.is_file():
            shutil.copy2(path, scripts / path.name)
    shutil.copytree(HERE / 'reference', work / 'reference', dirs_exist_ok=True)
    provenance = dict(libressl_release='4.4.1', libressl_url=LIBRESSL_URL,
                      libressl_archive_sha256=LIBRESSL_SHA256,
                      original_portable_git_commit='c4a8f5f86d15b08eb2f5dfb2aa44e90a0c1f6a3d',
                      original_openbsd_base='0fc62a7ccde3eed5e6825b9e54bd2a703b995a9d',
                      apple_source=APPLE_COMMIT, apple_url=APPLE_URL,
                      apple_archive_sha256=APPLE_SHA256,
                      experiment_head=output(['git', '-C', str(REPO), 'rev-parse', 'HEAD']),
                      experiment_status=output(['git', '-C', str(REPO), 'status', '--short']),
                      baseline_chacha_sha256=sha256(baseline), patched_chacha_sha256=sha256(changed),
                      ssh_cflags='-Os -g plus configure hardening',
                      libressl_cflags='-O2 -g plus configure hardening')
    (work / 'results/libressl-provenance.json').write_text(json.dumps(provenance, indent=2) + '\n')


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--work-dir', type=pathlib.Path, default=HERE / 'work')
    parser.add_argument('--expect-chip', help='Exact expected chip name; e.g. "Apple M3"')
    parser.add_argument('--prepare-only', action='store_true')
    args, benchmark_args = parser.parse_known_args()
    if platform.system() != 'Darwin' or platform.machine() != 'arm64':
        parser.error('Run locally on an Apple Silicon Mac, without Rosetta.')
    chip = output(['/usr/sbin/sysctl', '-n', 'machdep.cpu.brand_string'])
    print('Actual execution host chip:', chip, flush=True)
    if args.expect_chip and args.expect_chip != chip:
        parser.error('Expected ' + args.expect_chip + ', found ' + chip + '. Is this still the remote project?')
    work = args.work_dir.expanduser().resolve()
    if any(character.isspace() for character in str(work)):
        parser.error('Choose --work-dir with no spaces; e.g. ~/Developer/libressl-benchmark-work')
    if not args.prepare_only and '--label' not in benchmark_args:
        parser.error('Supply --label m3-air (or another machine/run label).')
    prepare(work)
    print('Prepared:', work, flush=True)
    if args.prepare_only:
        return
    results = work / 'results/machines'
    before = set(results.iterdir()) if results.exists() else set()
    env = dict(os.environ, SSH_PERF_ROOT=str(work))
    subprocess.run([sys.executable, str(work / 'scripts/benchmark_mac.py'), *benchmark_args], env=env, check=True)
    new = [path for path in set(results.iterdir()) - before if path.is_dir()]
    if len(new) != 1:
        raise RuntimeError('Expected one new machine result directory; inspect ' + str(results))
    report = HERE / 'reports' / new[0].name
    report.mkdir(parents=True)
    keep = ('REPORT.md', 'summary.csv', 'metadata.json', 'scp.jsonl', 'primitive.jsonl',
            'source-provenance.json', 'differential-sanitizers.log', 'check-current.log', 'check-neon.log')
    for name in keep:
        if (new[0] / name).exists():
            shutil.copy2(new[0] / name, report / name)
    print('Documented results ready for Git review:', report, flush=True)
    print('Builds, downloads, test keys and corpora remain in ignored work/.', flush=True)


if __name__ == '__main__':
    main()
