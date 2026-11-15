# Native LibreSSL benchmark: m3-air

- Chip: Apple M3
- Model: Mac15,12
- macOS: ProductName:		macOS, ProductVersion:		27.2, BuildVersion:		26B5112a
- UTC start: 20261115T022238Z
- Compiler: Apple clang version 21.0.0 (clang-2100.3.20.102)
- Configuration: {"cooldown": 60, "jobs": 4, "label": "m3-air", "mib": 512, "pairs": 5, "pause": 2, "skip_build": true, "skip_library_tests": false}
- Power configuration is recorded in `metadata.json`; no serial numbers are collected.

## SCP results

Each row is a median. CPU is combined client/server user plus kernel seconds.
Positive savings mean an improvement over unchanged LibreSSL 4.4.1 on this machine.

| Protocol | Data | Compression | CPU upstream → patched (s) | CPU saved | Wall upstream → patched (s) | Wall saved |
|---|---|---|---:|---:|---:|---:|
| SFTP | random | off | 3.301 → 2.700 | 18.2% | 1.550 → 1.221 | 21.2% |
| SFTP | random | on | 12.999 → 12.304 | 5.3% | 10.801 → 10.448 | 3.3% |
| SFTP | text | on | 4.862 → 4.795 | 1.4% | 3.338 → 3.237 | 3.0% |
| legacy SCP | random | off | 3.614 → 3.104 | 14.1% | 1.653 → 1.400 | 15.3% |
| legacy SCP | random | on | 13.170 → 12.464 | 5.4% | 10.745 → 10.426 | 3.0% |
| legacy SCP | text | on | 5.032 → 4.945 | 1.7% | 3.368 → 3.194 | 5.2% |

## EVP ChaCha primitive

| Bytes per operation | Upstream CPU µs | Patched CPU µs | CPU saved |
|---:|---:|---:|---:|
| 4 | 0.093 | 0.095 | -2.2% |
| 32 | 0.094 | 0.096 | -1.8% |
| 256 | 0.305 | 0.161 | 47.4% |
| 4096 | 4.797 | 2.510 | 47.7% |
| 32768 | 37.862 | 19.874 | 47.5% |
| 131072 | 149.526 | 79.006 | 47.2% |

## Method and limitations

Both libraries and Apple-source SSH variants are rebuilt locally with matching flags.
Only the LibreSSL ChaCha source patch differs. No zlib-ng or Poly1305 patch is applied.
Transfers run sequentially over loopback with the standard ChaCha20-Poly1305 cipher.
One warmup per condition is excluded; measured pairs alternate order.
Corpus generation and SHA-256 verification are outside timing. Every transfer is verified.
No system SSH, libraries, Remote Login settings, or power settings are changed.
The test uses warm filesystem caches, without fsync or CPU affinity.
It does not measure energy use, cold storage, WAN performance, or pure hardware differences.
Compiler, OS, scheduling, power mode and thermals may differ between Macs.
Consult raw runs and ranges in summary.csv; small differences may be noise.

Validation logs, source/patch hashes, linkage and banners accompany this report.
System Apple SSH was not used as the performance baseline.

## Comparison with the earlier M1 Max run

Compare within-machine patch savings, rather than interpreting absolute times as a chip comparison.
The M1 Max report used three measured SFTP runs; this run can use a different repetition count.

| Data | Compression | M1 Max CPU saved | This Mac CPU saved | M1 Max wall saved | This Mac wall saved |
|---|---|---:|---:|---:|---:|
| random | off | 20.0% | 18.2% | 18.9% | 21.2% |
| random | on | -0.3% | 5.3% | -2.1% | 3.3% |
| text | on | -4.5% | 1.4% | -5.1% | 3.0% |

## Run review and variability

This completed run contains 60 measured transfers and 12 excluded warmups, plus
60 measured primitive records and 12 primitive warmups. All 72 transfers passed
SHA-256 verification. Independent review rehashed both 512 MiB corpora, checked
the exact condition/variant order and five-pair matrix, and recomputed every CSV
median, range, savings percentage and CPU seconds/GiB from the raw measured records.
See `verification.json` for the review checks and corpus hashes.

Both complete LibreSSL suites passed 145/145 tests with no skips, failures or
errors. The normal and ASan/UBSan differential runs each passed all 49,488 cases.

### Transfer ranges

Each cell is the minimum–maximum over five measured repetitions. Warmups are excluded.

| Protocol | Data | Compression | Upstream CPU (s) | Patched CPU (s) | Upstream wall (s) | Patched wall (s) |
|---|---|---|---:|---:|---:|---:|
| SFTP | random | off | 3.218–3.324 | 2.606–2.726 | 1.497–1.557 | 1.175–1.314 |
| SFTP | random | on | 12.866–13.540 | 12.229–13.014 | 10.662–11.280 | 10.341–11.218 |
| SFTP | text | on | 4.701–5.092 | 4.680–4.977 | 3.178–3.476 | 3.168–3.364 |
| legacy SCP | random | off | 3.473–4.326 | 2.835–3.201 | 1.540–2.182 | 1.166–1.593 |
| legacy SCP | random | on | 12.836–13.549 | 12.183–12.633 | 10.500–11.091 | 10.163–10.589 |
| legacy SCP | text | on | 4.833–6.335 | 4.745–6.618 | 3.153–4.570 | 3.095–4.785 |

### Primitive CPU ranges

CPU microseconds per operation, minimum–maximum over five measured repetitions.

| Bytes per operation | Upstream CPU µs | Patched CPU µs |
|---:|---:|---:|
| 4 | 0.092–0.093 | 0.094–0.095 |
| 32 | 0.094–0.095 | 0.095–0.097 |
| 256 | 0.303–0.310 | 0.157–0.161 |
| 4096 | 4.688–5.192 | 2.469–2.525 |
| 32768 | 37.271–39.841 | 19.641–20.514 |
| 131072 | 148.469–151.055 | 78.530–79.630 |

### Interpretation

The clearest transfer benefit in this run is uncompressed random SFTP: median
combined CPU fell from 3.301 to 2.700 seconds (18.2%) and elapsed time from 1.550
to 1.221 seconds (21.2%). Its baseline and patched measured ranges do not overlap
for either metric. Legacy SCP saved 14.1% median CPU and 15.3% elapsed time, with
more variability and overlapping elapsed-time ranges.

Compressed random transfers saved about 5.3–5.4% median CPU and 3.0–3.3% elapsed
time. Compressed text saved only 1.4–1.7% median CPU; its CPU and elapsed-time
ranges overlap substantially. The slow third legacy-text pair is retained in
full. These five-pair observations do not establish a general compressed-transfer
gain, and no significance test or confidence interval is claimed.

Primitive CPU savings were about 47.2–47.7% for 256-byte and larger operations.
The 4-byte and 32-byte medians were 2.2% and 1.8% slower, respectively; these
small differences should be treated cautiously. Primitive savings do not imply
the same percentage reduction in whole-transfer CPU or energy.

The earlier M1 Max main SFTP matrix saved 20.0% CPU and 18.9% elapsed time for
uncompressed random data, compared with 18.2% and 21.2% here. Its compressed
conditions did not establish consistent gains. The separately documented M1 Max
five-pair compressed-random confirmation (1.0% CPU saved but 6.8% more elapsed
time) is not pooled into either main matrix. The earlier 32 KiB primitive result
was about 54.2% CPU saved, versus 47.5% here. These are within-machine patch
comparisons with different OS/compiler versions and repetition counts, not an
isolated M1-versus-M3 architecture comparison. The reference methodology is in
`../../reference/README.md` and its accompanying CSV.

### Restart and execution provenance

The branch was updated with `git pull --ff-only` to
`43c666dfe29ef191ef9e8006525c982d83ac7650` before the initial attempt. Both
LibreSSL and OpenSSH variants were freshly built on this M3 with the documented
flags. At the user's request, that attempt (`m3-air-20261115T013717Z`) was paused
before transfer timing. Its completed primitive timing is excluded from this
report. The paused process was subsequently terminated, absence of timing
children checked, and its empty benchmark lock removed.

After the user requested resumption, this run reused those local builds with
`--skip-build`. Both complete library suites, differential/sanitizer checks,
linkage checks, primitive timing, cooldowns, warmups and all five transfer pairs
ran again. No library test was skipped. The exact successful command was:

```sh
GIT_CONFIG_COUNT=2 \
GIT_CONFIG_KEY_0=core.trustctime GIT_CONFIG_VALUE_0=false \
GIT_CONFIG_KEY_1=core.checkStat GIT_CONFIG_VALUE_1=minimal \
python3 benchmarks/macos/run.py --expect-chip 'Apple M3' --label m3-air --skip-build
```

The Git settings applied only to this command and its subprocesses. A normal
status refresh was blocked reading an iCloud-offloaded, unrelated manual page;
ignoring ctime and subsecond timestamp noise allowed status to complete. An
identical generated `work/reference/README.md` copy also had to be recreated
because its filesystem compression flag prevented Python's metadata copy. These
preparation retries produced no timing records. No tracked implementation,
harness, cipher, compression algorithm or persistent Git setting was changed.

The source/patch hashes, tested SSH binary hashes and linkage are recorded in
`source-provenance.json` and `metadata.json`. Detailed build/configure logs remain
in ignored `benchmarks/macos/work/results/machines/m3-air-20261115T022238Z/`, with
the runner's original archive alongside it as `m3-air-20261115T022238Z.tar.gz`. The committed
report includes these review annotations and supplemental verification and
environment files; the runner's original archive predates those additions.

### Power and background activity

The user confirmed this is a fanless MacBook Air and that it was not completely
idle. Fanless cooling can constrain sustained performance; possible throttling
must remain a caveat rather than being asserted as the cause of any difference
from the M1 Max. No continuous temperature, clock-frequency or core-residency
trace was collected, so a fixed thermal state cannot be established. Background
process CPU is excluded from the transfer CPU total, but frequency changes and
resource contention can still influence both CPU seconds and elapsed time.
Paired order does not eliminate these effects, and gains are not known lower
bounds. See the [combined comparison](../../RESULTS.md).

The completed run began on AC power with low-power mode disabled. AC was also
confirmed before transfer timing and after completion. macOS reported no thermal
or performance warnings at the recorded checks; this does not prove constant
temperature or absence of throttling.

The Mac was not completely idle. A snapshot before primitive timing showed
iCloud/file-provider, Codex and other system work. During the cooldown before
transfers, Spotlight workers and desktop processes were visible; after all timing,
Codex and file-provider activity remained. The three timestamped snapshots in
`environment-observations.jsonl` are point observations, not continuous monitoring
or a way to attribute individual slow runs. Background CPU and filesystem activity
are material limitations, especially for small compressed-text differences.
No background services were stopped or power settings changed for this run.

The exported files were reviewed for publication. They contain local build paths
with the username, as anticipated by the benchmark README; no private keys are
included. Builds, corpora, keys, interrupted-run output and earlier blocked-attempt
reports are excluded from this commit.
