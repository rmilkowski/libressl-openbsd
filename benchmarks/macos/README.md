# Benchmark this branch on a second Apple Silicon Mac

This directory makes the experiment reproducible from a normal Git clone. The
crypto implementation is a separate commit from these benchmark tools, so an
eventual upstream patch can contain only the cipher change.

## Start on the MacBook Air M3

Open a **local Terminal on the Air**, not an SSH shell to the original Mac:

```sh
mkdir -p "$HOME/Developer"
git clone --branch experiment/libressl-4.4.1-neon --single-branch \
  https://github.com/rmilkowski/libressl-openbsd.git \
  "$HOME/Developer/libressl-openbsd"
cd "$HOME/Developer/libressl-openbsd"
```

In Codex on the Air, add that local folder as a new project, for example
**LibreSSL M3 benchmarks**. Choose local execution for the new chat. Keeping the
existing remote project open does not copy its files or move execution to the Air.

Paste this into a new chat in the local project:

> Read benchmarks/macos/README.md. Run the documented full baseline-versus-patch
> benchmark locally on this MacBook Air M3. Verify the actual execution chip is
> Apple M3 before starting; stop if this is the remote M1 Max. Use five pairs and
> 512 MiB files, standard SCP/SFTP and legacy SCP, with compression off and on as
> documented. Keep the cipher and compression algorithms unchanged. Preserve raw
> data and validation logs, and summarize CPU seconds, elapsed time, variability,
> and the comparison with the earlier M1 Max results. Do not change the crypto
> patch to make the measurements look better. Save the generated report files in
> benchmarks/macos/reports/, ready to review and commit.

Or run directly from the Air's local Terminal:

```sh
python3 benchmarks/macos/run.py --expect-chip 'Apple M3' --label m3-air
```

The chip check prevents accidentally measuring the original remote Mac. This
runner requires native arm64 macOS, Python 3.9+, and Apple's compiler/SDK/Make
from Xcode or Command Line Tools. If missing, install Command Line Tools with
`xcode-select --install`. No Homebrew packages, GitHub token or system SSH
modification is needed. Public source downloads need HTTPS access to
`cdn.openbsd.org` and `codeload.github.com` during preparation.

Plug into AC power, keep the lid open and use normal power mode. Close other
CPU-heavy work and avoid builds during timing. The script records power and
thermal status without changing settings. Prevent sleep for the session if
needed. It can take several minutes plus compilation and validation time.

## Controlled comparison

The runner downloads the official LibreSSL 4.4.1 release and the pinned public
Apple OpenSSH source, verifies their SHA-256 hashes, and prepares two source
trees under ignored `work/`. The baseline ChaCha file is checked against the
exact file used in the M1 Max experiment. The candidate differs by copying
`src/lib/libcrypto/chacha/chacha-merged.c` from **this branch**.

| Variant | Library | SSH |
|---|---|---|
| Baseline | Unchanged LibreSSL 4.4.1, `-O2 -g` | Apple 10.2p1 source, `-Os -g` |
| Patched | Same release and flags, with this ChaCha patch | Same source and flags |

Configure-selected hardening applies to both. Both SSH builds use Apple's public
configure recipe and the identical small public-SDK adaptation in
`apple-public-sdk.patch`. These are not bit-for-bit reproductions of the shipping
Apple executables. No zlib-ng or Poly1305 patch is applied. System SSH, libraries,
shell defaults and Remote Login settings are untouched.

Validation runs both complete library regression suites, the 49,488-case ChaCha
differential test, and that differential suite with the changed implementation
under ASan/UBSan. The runner verifies SSH links the intended dylib and selects
the EVP ChaCha path. It records source/patch/binary hashes and executable banners.

The timed work is:

- EVP ChaCha operations at 4, 32, 256, 4096, 32768 and 131072 bytes, with the same
  IV-reset call pattern used by SSH; output equality is checked.
- Sequential 512 MiB loopback uploads with standard
  `chacha20-poly1305@openssh.com`. Each endpoint uses the corresponding build.
- Both default SFTP and legacy `scp -O`, each with random/uncompressed data,
  random/`scp -C` data, and structured text/`scp -C` data.
- One excluded warmup per condition and five measured baseline/patched pairs.
  Condition order is reproducibly shuffled; variant order alternates.

There are 60 measured transfers plus 12 warmups. Each file is SHA-256 checked.
CPU includes client and server user/kernel time. Elapsed time includes connection
setup and shutdown. Corpus generation and checksum calculation are outside timing.
The runner waits 60 seconds after validation and 60 after primitive timing before
SCP, with two seconds idle between transfer pairs. These rest intervals do not
guarantee a particular hardware temperature.

## Reports and returning results

The runner copies report artifacts into a directory that Git can track:

```text
benchmarks/macos/reports/m3-air-<UTC timestamp>/
    REPORT.md
    summary.csv
    metadata.json
    scp.jsonl
    primitive.jsonl
    source-provenance.json
    differential-sanitizers.log
    check-current.log
    check-neon.log
```

The report includes a table of CPU and wall-time savings per condition, primitive
results, method/limitations, and a comparison with the earlier M1 Max patch
savings. CSV retains min/max values and CPU seconds/GiB. Raw files retain every
warmup and measured run. No M3 result exists until a run actually completes there.

All detailed build logs and a results-only `.tar.gz` also remain in
`benchmarks/macos/work/results/machines/`. Downloads, executables, test keys and
file corpora stay in ignored `work/`; **do not add that directory to Git**.
No serial number, hardware UUID or hostname is collected intentionally. Build
paths and compiler diagnostics may contain your local username. Review files
before publishing them.

After reviewing a completed full run, these commands document it on the branch
and make it available to the original Mac:

```sh
git add benchmarks/macos/reports/m3-air-<UTC timestamp>
git commit -m 'Document native M3 Air LibreSSL benchmark results'
git push origin experiment/libressl-4.4.1-neon
```

Replace `<UTC timestamp>` with the generated directory suffix. The original Mac
can fetch the branch and compare the committed reports without transferring builds.

## Interpreting and repeating measurements

Use **patched versus baseline on the M3** to judge the patch. Positive percentage
savings mean a benefit; negative values mean a regression. Compression conditions
must remain separate. Small differences and overlapping ranges may be noise.
CPU time is not energy consumption; Activity Monitor CPU percentage is not the
primary measure. Do not omit slower runs or pool only favorable repetitions.

The M1 Max reference used three measured runs and default SFTP in its main matrix.
OS, compiler, scheduling, storage, power and thermals may differ. Compare
within-machine patch savings first; absolute M1/M3 throughput does not isolate
CPU architecture. For a stronger comparison, run this exact harness on both Macs.
Tests use warm caches with no fsync, affinity or cold-storage controls, and make
no claim about WAN performance. They add no threads to crypto, transfer workers,
protocol changes or weakened cryptography.

To repeat using builds produced **on this Mac**:

```sh
python3 benchmarks/macos/run.py --expect-chip 'Apple M3' \
  --label m3-air-repeat --skip-build
```

Library tests still run. `--skip-library-tests` skips `make check`, while
differential/sanitizer checks always run. All options and skips are recorded.
Use `--pairs 10` for a separate confirmation run when results are ambiguous.
Use a distinct `--label m3-air-smoke --pairs 1 --mib 16 --cooldown 0 --pause 0`
only for diagnostics, not a performance claim.

Paths used for building must have no spaces. If your clone path has spaces, add
`--work-dir "$HOME/Developer/libressl-benchmark-work"`. Use a fresh work directory
when changing the crypto patch; never reuse builds from another machine. If a run
is interrupted, ensure its child processes have exited before removing its empty
`work/experiment/native-benchmark.lock` directory and retrying.

## Workflow validation

Before publication, this workflow was tested on the original M1 Max using fresh
source extraction and builds. Both 145-test library suites passed, as did all
49,488 differential cases normally and under ASan/UBSan. A diagnostic run with
16 MiB files and one measured pair completed all 24 transfers (including warmups),
verified checksums, exported the reports and generated the M1 reference comparison.
The M3 chip guard was also checked to reject execution on the M1 Max. These are
workflow checks, not M3 measurements or a replacement for the full benchmark.
