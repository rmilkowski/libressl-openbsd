#!/usr/bin/env python3
"""Rebuild and document a paired LibreSSL experiment on a native Apple Silicon Mac."""
import argparse
import csv
import datetime
import hashlib
import json
import os
import pathlib
import platform
import random
import re
import shutil
import statistics
import subprocess
import sys
import time

ROOT = pathlib.Path(os.environ.get('SSH_PERF_ROOT', pathlib.Path(__file__).absolute().parents[1]))
BUILDS = ('apple-libressl', 'apple-libressl-neon')


def digest(path):
    h = hashlib.sha256()
    with path.open('rb') as stream:
        for block in iter(lambda: stream.read(1024 * 1024), b''):
            h.update(block)
    return h.hexdigest()


def capture(command):
    p = subprocess.run(command, text=True, stdout=subprocess.PIPE, stderr=subprocess.STDOUT)
    return p.stdout.strip() if p.returncode == 0 else 'unavailable: ' + p.stdout.strip()


def run(command, log, env, cwd=ROOT):
    print('Running:', ' '.join(map(str, command)), flush=True)
    with log.open('w') as output:
        p = subprocess.run(list(map(str, command)), cwd=cwd, env=env,
                           stdout=output, stderr=subprocess.STDOUT)
    if p.returncode:
        print(log.read_text()[-6000:], file=sys.stderr)
        raise RuntimeError('Command failed; see ' + str(log))


def report(out, metadata):
    raw = [json.loads(line) for line in (out / 'scp.jsonl').read_text().splitlines()]
    rows = []
    for legacy in (False, True):
        for compression, corpus in ((False, 'random'), (True, 'random'), (True, 'text')):
            groups = [[r for r in raw if r['phase'] == 'native-measured' and
                       (r['legacy'], r['compression'], r['corpus'], r['build']) ==
                       (legacy, compression, corpus, build)] for build in BUILDS]
            base, opt = groups
            for build, records in zip(BUILDS, groups):
                cpu = statistics.median(r['cpu'] for r in records)
                wall = statistics.median(r['wall'] for r in records)
                rows.append(dict(protocol='legacy SCP' if legacy else 'SFTP',
                                 corpus=corpus, compression=compression, build=build,
                                 n=len(records), cpu=cpu, wall=wall,
                                 cpu_seconds_per_gib=cpu / (records[0]['bytes'] / 2**30),
                                 cpu_min=min(r['cpu'] for r in records),
                                 cpu_max=max(r['cpu'] for r in records),
                                 wall_min=min(r['wall'] for r in records),
                                 wall_max=max(r['wall'] for r in records),
                                 cpu_saved_pct=100 * (1 - cpu / statistics.median(r['cpu'] for r in base)),
                                 wall_saved_pct=100 * (1 - wall / statistics.median(r['wall'] for r in base))))
    with (out / 'summary.csv').open('w', newline='') as stream:
        writer = csv.DictWriter(stream, fieldnames=list(rows[0]), lineterminator='\n')
        writer.writeheader()
        writer.writerows(rows)
    lines = ['# Native LibreSSL benchmark: ' + metadata['label'], '',
             '- Chip: ' + metadata['chip'], '- Model: ' + metadata['model'],
             '- macOS: ' + metadata['macos'].replace('\n', ', '), '- UTC start: ' + metadata['started_utc'],
             '- Compiler: ' + metadata['compiler'].splitlines()[0],
             '- Configuration: ' + json.dumps(metadata['arguments'], sort_keys=True),
             '- Power configuration is recorded in `metadata.json`; no serial numbers are collected.', '',
             '## SCP results', '',
             'Each row is a median. CPU is combined client/server user plus kernel seconds.',
             'Positive savings mean an improvement over unchanged LibreSSL 4.4.1 on this machine.', '',
             '| Protocol | Data | Compression | CPU upstream → patched (s) | CPU saved | Wall upstream → patched (s) | Wall saved |',
             '|---|---|---|---:|---:|---:|---:|']
    for base, opt in zip(rows[::2], rows[1::2]):
        lines.append('| {} | {} | {} | {:.3f} → {:.3f} | {:.1f}% | {:.3f} → {:.3f} | {:.1f}% |'.format(
            base['protocol'], base['corpus'], 'on' if base['compression'] else 'off',
            base['cpu'], opt['cpu'], opt['cpu_saved_pct'], base['wall'], opt['wall'], opt['wall_saved_pct']))
    primitive = [json.loads(line) for line in (out / 'primitive.jsonl').read_text().splitlines()]
    lines += ['', '## EVP ChaCha primitive', '',
              '| Bytes per operation | Upstream CPU µs | Patched CPU µs | CPU saved |',
              '|---:|---:|---:|---:|']
    for size in sorted({r['size'] for r in primitive}):
        values = [statistics.median(r['cpu'] * 1e6 / r['iterations'] for r in primitive
                  if r['size'] == size and r['backend'] == backend and not r['warmup'])
                  for backend in ('upstream', 'neon')]
        lines.append('| {} | {:.3f} | {:.3f} | {:.1f}% |'.format(
            size, values[0], values[1], 100 * (1 - values[1] / values[0])))
    lines += ['', '## Method and limitations', '',
              'Both libraries and Apple-source SSH variants are rebuilt locally with matching flags.',
              'Only the LibreSSL ChaCha source patch differs. No zlib-ng or Poly1305 patch is applied.',
              'Transfers run sequentially over loopback with the standard ChaCha20-Poly1305 cipher.',
              'One warmup per condition is excluded; measured pairs alternate order.',
              'Corpus generation and SHA-256 verification are outside timing. Every transfer is verified.',
              'No system SSH, libraries, Remote Login settings, or power settings are changed.',
              'The test uses warm filesystem caches, without fsync or CPU affinity.',
              'It does not measure energy use, cold storage, WAN performance, or pure hardware differences.',
              'Compiler, OS, scheduling, power mode and thermals may differ between Macs.',
              'Consult raw runs and ranges in summary.csv; small differences may be noise.', '',
              'Validation logs, source/patch hashes, linkage and banners accompany this report.',
              'System Apple SSH was not used as the performance baseline.', '']
    reference = ROOT / 'reference/m1-max-libressl-summary.csv'
    if reference.exists():
        with reference.open() as stream:
            m1 = list(csv.DictReader(stream))
        lines += ['## Comparison with the earlier M1 Max run', '',
                  'Compare within-machine patch savings, rather than interpreting absolute times as a chip comparison.',
                  'The M1 Max report used three measured SFTP runs; this run can use a different repetition count.', '',
                  '| Data | Compression | M1 Max CPU saved | This Mac CPU saved | M1 Max wall saved | This Mac wall saved |',
                  '|---|---|---:|---:|---:|---:|']
        for r in rows:
            if r['protocol'] != 'SFTP' or r['build'] != BUILDS[1]:
                continue
            old = next(x for x in m1 if x['build'] == BUILDS[1] and
                       x['corpus'] == r['corpus'] and (x['compression'] == 'True') == r['compression'])
            lines.append('| {} | {} | {:.1f}% | {:.1f}% | {:.1f}% | {:.1f}% |'.format(
                r['corpus'], 'on' if r['compression'] else 'off', float(old['cpu_saved_vs_current_pct']),
                r['cpu_saved_pct'], float(old['wall_saved_vs_current_pct']), r['wall_saved_pct']))
        lines.append('')
    (out / 'REPORT.md').write_text('\n'.join(lines))


def main():
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument('--label', required=True, help='e.g. m3-air')
    ap.add_argument('--pairs', type=int, default=5)
    ap.add_argument('--mib', type=int, default=512)
    ap.add_argument('--cooldown', type=float, default=60, help='Idle seconds after validation, and before SCP')
    ap.add_argument('--pause', type=float, default=2, help='Idle seconds between transfer pairs')
    ap.add_argument('--jobs', type=int, default=4)
    ap.add_argument('--skip-build', action='store_true', help='Reuse builds from this extracted directory only')
    ap.add_argument('--skip-library-tests', action='store_true', help='Skip make check; differential and sanitizer checks still run')
    a = ap.parse_args()
    if platform.system() != 'Darwin' or platform.machine() != 'arm64':
        ap.error('Run natively on an Apple Silicon Mac, not through Rosetta or the remote project connection.')
    if any(c.isspace() for c in str(ROOT)):
        ap.error('Extract to a path without spaces, or set SSH_PERF_ROOT to a space-free symlink to it.')
    if a.pairs < 1 or a.mib < 1 or a.jobs < 1 or a.cooldown < 0 or a.pause < 0:
        ap.error('pairs, mib and jobs must be positive; cooldown and pause must be nonnegative')
    label = re.sub(r'[^a-zA-Z0-9_.-]', '-', a.label)
    manifest = ROOT / 'BUNDLE-MANIFEST.json'
    if manifest.exists():
        print('Verifying source bundle hashes...', flush=True)
        for name, expected in json.loads(manifest.read_text())['files'].items():
            if digest(ROOT / name) != expected:
                raise RuntimeError('Bundle hash mismatch: ' + name)
    (ROOT / 'experiment').mkdir(exist_ok=True)
    (ROOT / 'results').mkdir(exist_ok=True)
    lock = ROOT / 'experiment/native-benchmark.lock'
    try:
        lock.mkdir()
    except FileExistsError:
        ap.error('Another benchmark may be running: ' + str(lock))
    try:
        execute(a, label)
    finally:
        lock.rmdir()


def execute(a, label):
    stamp = datetime.datetime.now(datetime.timezone.utc).strftime('%Y%m%dT%H%M%SZ')
    out = ROOT / 'results/machines' / (label + '-' + stamp)
    out.mkdir(parents=True)
    env = dict(os.environ, SSH_PERF_ROOT=str(ROOT), SSH_PERF_JOBS=str(a.jobs),
               CC='/usr/bin/clang', CXX='/usr/bin/clang++')
    for name in ('CFLAGS', 'CPPFLAGS', 'CXXFLAGS', 'LDFLAGS'):
        env.pop(name, None)
    metadata = dict(label=label, started_utc=stamp, arguments=vars(a),
                    chip=capture(['/usr/sbin/sysctl', '-n', 'machdep.cpu.brand_string']),
                    model=capture(['/usr/sbin/sysctl', '-n', 'hw.model']),
                    memory_bytes=capture(['/usr/sbin/sysctl', '-n', 'hw.memsize']),
                    logical_cpus=capture(['/usr/sbin/sysctl', '-n', 'hw.logicalcpu']),
                    architecture=platform.machine(), macos=capture(['/usr/bin/sw_vers']),
                    compiler=capture(['/usr/bin/clang', '--version']),
                    sdk=capture(['/usr/bin/xcrun', '--show-sdk-version']),
                    power=capture(['/usr/bin/pmset', '-g', 'custom']),
                    battery=capture(['/usr/bin/pmset', '-g', 'batt']),
                    thermal_before=capture(['/usr/bin/pmset', '-g', 'therm']))
    # Prepared sources avoid needing Autoconf/Homebrew or network access on the second Mac.
    baseline = ROOT / 'libressl-portable/crypto/chacha/chacha-merged.c'
    patched = ROOT / 'libressl-neon/crypto/chacha/chacha-merged.c'
    if not patched.exists():
        shutil.copytree(ROOT / 'libressl-portable', ROOT / 'libressl-neon',
                        ignore=shutil.ignore_patterns('.git', 'openbsd', 'autom4te.cache'))
        run(['/usr/bin/patch', '-p1', '-i', ROOT / 'results/libressl-441-neon-portable.patch'],
            out / 'apply-patch.log', env, cwd=ROOT / 'libressl-neon')
    metadata['baseline_chacha_sha256'] = digest(baseline)
    metadata['patched_chacha_sha256'] = digest(patched)
    metadata['patch_sha256'] = digest(ROOT / 'results/libressl-441-neon-portable.patch')
    if metadata['baseline_chacha_sha256'] == metadata['patched_chacha_sha256']:
        raise RuntimeError('Baseline and patched sources are identical')
    manifest_path = ROOT / 'BUNDLE-MANIFEST.json'
    if manifest_path.exists():
        expected = json.loads(manifest_path.read_text())['patched_chacha_sha256']
        if metadata['patched_chacha_sha256'] != expected:
            raise RuntimeError('Patched ChaCha hash differs from the packaged experiment')
    shutil.copy2(ROOT / 'results/libressl-provenance.json', out / 'source-provenance.json')
    (out / 'metadata.json').write_text(json.dumps(metadata, indent=2) + '\n')
    print('Machine:', metadata['chip'], '\nResults:', out, flush=True)
    if not a.skip_build:
        for library in ('current', 'neon'):
            run(['/bin/sh', ROOT / 'scripts/build_libressl.sh', library], out / ('build-' + library + '.log'), env)
        for build in BUILDS:
            run(['/bin/sh', ROOT / 'scripts/build_apple_ssh.sh', build], out / ('build-' + build + '.log'), env)
    # Preserve detailed configure/make logs in the machine-specific result directory.
    for pattern in ('configure-*.log', 'make-*.log', 'install-libressl-*.log'):
        for path in (ROOT / 'results').glob(pattern):
            shutil.copy2(path, out / path.name)
    for build, library in zip(BUILDS, ('current', 'neon')):
        binary = ROOT / 'builds' / build / 'ssh'
        linkage = capture(['/usr/bin/otool', '-L', str(binary)])
        expected = str(ROOT / 'builds' / ('libressl-' + library) / 'install/lib/libcrypto')
        if expected not in linkage:
            raise RuntimeError('Unexpected crypto linkage for ' + build + ': ' + linkage)
        metadata[build] = dict(version=capture([str(binary), '-V']), linkage=linkage,
                               sha256=digest(binary))
        config = (binary.parent / 'config.h').read_text()
        if '#define HAVE_EVP_CHACHA20 1' not in config or '#define HAVE_BROKEN_CHACHA20 1' in config:
            raise RuntimeError('SSH is not selecting the libcrypto ChaCha implementation')
        if not a.skip_library_tests:
            run(['make', '-j' + str(a.jobs), 'check'], out / ('check-' + library + '.log'), env,
                cwd=ROOT / 'builds' / ('libressl-' + library))
    run(['/bin/sh', ROOT / 'scripts/test_libressl_chacha.sh'], out / 'differential-sanitizers.log', env)
    primitive = ROOT / 'experiment/bench_libressl_pair'
    run(['/usr/bin/clang', '-O2', ROOT / 'scripts/bench_libressl_pair.c', '-o', primitive],
        out / 'build-primitive.log', env)
    print('Cooling down before primitive timing...', flush=True)
    time.sleep(a.cooldown)
    libraries = [ROOT / 'builds' / ('libressl-' + lib) / 'install/lib/libcrypto.57.dylib'
                 for lib in ('current', 'neon')]
    run([primitive, *libraries, str(a.pairs)], out / 'primitive.jsonl', env)
    print('Cooling down before SCP timing...', flush=True)
    time.sleep(a.cooldown)
    cases = [(legacy, compressed, corpus) for legacy in (False, True)
             for compressed, corpus in ((False, 'random'), (True, 'random'), (True, 'text'))]
    # Randomize condition order reproducibly; reverse baseline/patched order in each pair.
    with (out / 'scp.jsonl').open('w') as raw:
        for round_index in range(a.pairs + 1):
            order = list(cases)
            random.Random(6673 + round_index).shuffle(order)
            for legacy, compressed, corpus in order:
                order_builds = BUILDS if (round_index + cases.index((legacy, compressed, corpus))) % 2 == 0 else BUILDS[::-1]
                for build in order_builds:
                    cmd = [sys.executable, str(ROOT / 'scripts/bench.py'), '--build', build,
                           '--cipher', 'chacha20-poly1305@openssh.com', '--mib', str(a.mib),
                           '--corpus', corpus, '--repeat', '1', '--round', str(round_index),
                           '--phase', 'native-warmup' if round_index == 0 else 'native-measured']
                    if legacy:
                        cmd.append('--legacy')
                    if compressed:
                        cmd.append('--compression')
                    p = subprocess.run(cmd, env=env, cwd=ROOT, text=True, capture_output=True)
                    if p.returncode:
                        (out / 'failed-transfer.log').write_text(p.stdout + p.stderr)
                        raise RuntimeError('Transfer failed; see ' + str(out / 'failed-transfer.log'))
                    records = [json.loads(line) for line in p.stdout.splitlines() if line.startswith('{')]
                    if len(records) != 1:
                        raise RuntimeError('Expected one transfer result')
                    raw.write(json.dumps(records[0]) + '\n')
                    raw.flush()
                    print('round', round_index, 'legacy', legacy, 'compression', compressed,
                          corpus, build, 'CPU', records[0]['cpu'], flush=True)
                time.sleep(a.pause)
    metadata['thermal_after'] = capture(['/usr/bin/pmset', '-g', 'therm'])
    metadata['finished_utc'] = datetime.datetime.now(datetime.timezone.utc).isoformat()
    (out / 'metadata.json').write_text(json.dumps(metadata, indent=2) + '\n')
    report(out, metadata)
    # A small portable result artifact; source/build directories and test keys are excluded.
    archive = pathlib.Path(shutil.make_archive(str(out), 'gztar', root_dir=out.parent, base_dir=out.name))
    print('Report:', out / 'REPORT.md', '\nReturn this results archive:', archive, flush=True)


if __name__ == '__main__':
    main()
