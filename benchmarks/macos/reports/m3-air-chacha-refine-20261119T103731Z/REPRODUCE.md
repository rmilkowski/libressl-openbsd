# Reproduce the ChaCha comparison

The measured source is `e904cc1ba13ecac94d9941311f5edf7e43a3c433`. The program that checks the M3, the three-way EVP harness, the SSH transfer driver, the randomized condition order, and the summary calculations are in [reproduce](reproduce/).

## Build on an M3 Mac

Use Apple’s compiler and command-line tools, GNU Make as provided by Apple, Git, and Python 3.11 or later. The commands below assume this report directory is the current directory and use a fresh, space-free build path. The named references pin the provenance labels used by the original timing driver.

```sh
report="$PWD"
lab=$(mktemp -d /private/tmp/chacha-m3.XXXXXX)
repo="$lab/source"
git clone --single-branch --branch experiment/chacha-aarch64-neon-refine \
    https://github.com/rmilkowski/libressl-openbsd.git "$repo"
git -C "$repo" switch --detach e904cc1ba13ecac94d9941311f5edf7e43a3c433
git -C "$repo" fetch origin \
    5259b312e7d54bbcde9d13537f083dcd669c2cbb:refs/remotes/origin/upstream/chacha-aarch64-neon
git -C "$repo" fetch origin \
    1a8bfb53bc7034a8f877875aa833a8c3c10b8731:refs/remotes/libressl/master
git -C "$repo" fetch origin 0ad357b80c10af3910eca6ba974db73771eac418
python3 "$report/reproduce/prepare-macos.py" "$repo" "$lab/work"
```

The preparation script downloads the same two archives, verifies their hashes, builds stock, previous, and refined LibreSSL in separate prefixes, runs each library suite, and links the three matching Apple OpenSSH builds. It reuses the original public-SDK adaptation from the fork. Binaries and randomly generated data can have new hashes on a repeat. The original binary and source hashes are in [timing-environment.json](timing-environment.json) and [source-verification.json](source-verification.json).

## Time the three builds

Connect AC power, use the normal power mode, and leave the M3 available for the measurements. Both drivers check the execution chip and power source. A sandboxed agent needs permission to read the real chip identity and open loopback sockets. The original runbook spells out that procedure. [Sandboxed-agent instructions](https://github.com/rmilkowski/libressl-openbsd/blob/0ad357b80c10af3910eca6ba974db73771eac418/benchmarks/macos/README.md#running-from-a-sandboxed-codex-agent)

```sh
python3 "$lab/work/run-timing.py" "$repo"
python3 "$lab/work/run-matrix.py"
```

The first driver runs EVP and a six-round uncompressed SFTP confirmation. The second runs all six SSH protocol, corpus and compression combinations. Each measured round uses each source version once. The timing files remain in `$lab/work/results`. Use a fresh directory for a new series.

## Recalculate the published values

The summary tool verifies row counts, all six order permutations, round membership, file hashes within each corpus, byte counts, and the recorded CPU components. It writes `summary.csv` to the argument directory. The transfer CPU and wall fields use seconds per 512 MiB upload. Doubling either an individual CPU sample or its median gives CPU seconds per GiB. Primitive fields use seconds per call.

```sh
mkdir "$lab/recalculated"
cp "$report/"*confirmation.jsonl "$report/"hosted-*.csv "$report/"*environment.json "$lab/recalculated/"
python3 "$report/reproduce/summarize-series.py" "$lab/recalculated"
cmp "$report/summary.csv" "$lab/recalculated/summary.csv"
```

The published Linux schedules, compiler flags and operating-system identity can also be inspected in the jobs that produced the hosted samples. Their test commit has the same cipher and regression blobs as the source branch. [Hosted CPU comparison](https://github.com/rmilkowski/libressl-openbsd/actions/runs/44507292360)

## Check the submission diff

Run these commands in a disposable checkout at the recorded upstream base. Ordinary `patch` and Git both accept this diff at the OpenBSD `src` directory level. The report records the SHA-256 values of the reviewed files. [OpenBSD diff guidance](https://www.openbsd.org/faq/faq5.html#Diff)

```sh
git -C "$repo" worktree add --detach "$lab/base" 1a8bfb53bc7034a8f877875aa833a8c3c10b8731
git -C "$lab/base" apply --check -p0 --directory=src "$report/chacha-aarch64-neon-refine.diff"
(cd "$lab/base/src" && patch -p0 < "$report/chacha-aarch64-neon-refine.diff")
cmp "$lab/base/src/lib/libcrypto/chacha/chacha-merged.c" "$repo/src/lib/libcrypto/chacha/chacha-merged.c"
cmp "$lab/base/src/regress/lib/libcrypto/chacha/chachatest.c" "$repo/src/regress/lib/libcrypto/chacha/chachatest.c"
```

## Repeat the native bounds and sanitizer checks

The validation harness exports the candidate from Git, compiles a separate stock scalar implementation, exercises forced fallback and sanitizer builds, and records compiler-selection checks. Its older scalar reference and the current base have identical ChaCha implementation bytes. The last two commands run the expanded sweep around the new fourth-lane boundary.

```sh
git -C "$repo" archive 0ad357b80c10af3910eca6ba974db73771eac418 \
    benchmarks/macos/upstream-review/validate.sh \
    benchmarks/macos/upstream-review/test_bounds.c \
    benchmarks/macos/tools/test_libressl_chacha.c | tar -x -C "$lab"
inc="$lab/work/builds/libressl-current/install/include"
sh "$lab/benchmarks/macos/upstream-review/validate.sh" "$repo" "$inc" "$lab/checks"
/usr/bin/clang -O1 -g -fsanitize=address,undefined -fno-sanitize-recover=all \
    -fno-omit-frame-pointer -I"$inc" "$report/reproduce/test-extra-bounds.c" -o "$lab/extra-bounds"
"$lab/extra-bounds" "$lab/checks/scalar.dylib" "$lab/checks/sanitized.dylib"
```
