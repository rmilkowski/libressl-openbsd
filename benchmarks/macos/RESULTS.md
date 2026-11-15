# LibreSSL ChaCha results on M1 Max and M3 Air

Both experiments compare unchanged LibreSSL 4.4.1 with the experimental
four-block NEON ChaCha patch, using matching builds of Apple's public OpenSSH
10.2p1 recipe. No zlib-ng or Poly1305 optimization is included. CPU is combined
client/server user plus kernel time; positive savings mean an improvement.

These measurements describe the original patch in commit `0e19b180`, whose
ChaCha source SHA-256 is
`6940f3b605310df380d67cf4dcd50982b1d4228c3a07e7f3d61f40400aa62efa`.
Subsequent upstream preparation must be validated separately; these historical
M3 measurements must not be relabeled as results for a changed implementation.

A [separate upstream-preparation candidate and validation](upstream-review/README.md)
now records the cleaned implementation, Astra review and a fresh M1 Max
confirmation for revision `289dcecb`. That candidate saved 21.1% transfer CPU
and 20.5% elapsed time in its own five-pair uncompressed SFTP run, with 54.5%
primitive CPU saved
at 32 KiB. It has not been benchmarked on the M3 or native OpenBSD hardware.
The later [contribution audit](upstream-review/contribution-audit/README.md)
records style/test cleanup in `5259b312` and expanded correctness/CI checks,
including OpenBSD VM execution; those are not new performance measurements.
The table below continues to describe the original two-Mac experiment only.

## Results

| Machine | Protocol | Data | Compression | CPU saved | Elapsed time saved |
|---|---|---|---|---:|---:|
| M1 Max | SFTP | random | off | 20.0% | 18.9% |
| M1 Max | SFTP | random | on | -0.3% | -2.1% |
| M1 Max | SFTP | text | on | -4.5% | -5.1% |
| M3 Air | SFTP | random | off | 18.2% | 21.2% |
| M3 Air | SFTP | random | on | 5.3% | 3.3% |
| M3 Air | SFTP | text | on | 1.4% | 3.0% |
| M3 Air | legacy SCP | random | off | 14.1% | 15.3% |
| M3 Air | legacy SCP | random | on | 5.4% | 3.0% |
| M3 Air | legacy SCP | text | on | 1.7% | 5.2% |

The 32 KiB EVP primitive CPU reduction was 54.2% on the M1 Max and 47.5% on
the M3 Air. Primitive savings do not imply equal whole-transfer savings. The
patch has not demonstrated 40% CPU savings for complete transfers.

On the M3, all five uncompressed SFTP pairs improved: CPU savings ranged from
17.4% to 20.1%, and elapsed savings from 15.2% to 24.5%. All five measured
compressed-random pairs also improved in CPU and wall time for each protocol.
Those smaller gains need confirmation under quieter conditions. Compressed-text
pairs have mixed signs; their small median differences are inconclusive.

The separate M1 Max five-pair compressed-random confirmation saved 1.0% CPU but
took 6.8% more elapsed time. It is not pooled into the M1 main matrix or M3 data.

## M3 Air conditions and caveats

The user confirmed that this is a fanless MacBook Air and that the computer was
not completely idle. The recorded machine is Apple M3, Mac15,12, with 24 GiB RAM,
macOS 27.2 build 26B5112a and Apple Clang 21.0.0 (`clang-2100.3.20.102`). It ran
on AC power with low-power mode disabled.

Point observations recorded iCloud/file-provider, Spotlight, Codex and other
desktop/system activity. These are not continuous measurements and cannot
attribute individual outliers. The report includes every run, including the
slow legacy compressed-text pair.

No thermal/performance warnings were recorded at the sampled checks. This does
not establish constant frequency or temperature, or rule out throttling. The
fanless cooling and background load are material limitations. We did not collect
a continuous frequency, temperature, power or core-residency trace.

The CPU metric excludes unrelated processes' CPU consumption, but frequency
changes and resource contention can still affect measured CPU seconds; scheduling
and filesystem activity can also affect elapsed time. Pairing and alternating
variant order reduce some bias without eliminating it. These effects can favor
either variant; the observed gains are not established lower bounds.

## Comparison boundary and validation

Each transfer is 512 MiB over loopback, with one excluded warmup per condition.
The M1 main matrix has three measured repetitions and default SFTP; the M3 has
five measured pairs and both default SFTP and legacy SCP. Data generation and
SHA-256 verification are outside timing. There is no fsync, cold-cache control
or core pinning. Both Macs were shared development machines rather than isolated
benchmark hosts. OS/compiler versions and thermal conditions can differ.

Compare the patch against the baseline on each Mac. Absolute cross-machine
times do not isolate hardware architecture, and CPU time does not measure energy.
The clearest replicated result is lower CPU and elapsed time for uncompressed
SFTP. A general compression-enabled improvement is not established across Macs.

Both library suites passed 145/145 tests on each Mac. The normal and ASan/UBSan
differential suites each passed 49,488 cases. All files were checksum-verified.
The M3 completed 60 measured transfers plus 12 warmups. Its successful run reused
builds freshly produced on the same M3 after a user-requested interruption; all
library tests and measurements ran again. That provenance is preserved in its
report, rather than treating the interrupted attempt as another measured run.

Sources: [M1 reference](reference/README.md),
[M1 summary CSV](reference/m1-max-libressl-summary.csv),
[M3 report and provenance](reports/m3-air-20261115T022238Z/REPORT.md),
[M3 raw transfers](reports/m3-air-20261115T022238Z/scp.jsonl),
[M3 environment observations](reports/m3-air-20261115T022238Z/environment-observations.jsonl).
