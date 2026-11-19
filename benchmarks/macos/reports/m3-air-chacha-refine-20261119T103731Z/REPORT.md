# ChaCha20 partial-block performance on Apple M3 and Arm Neoverse N2

19 November 2026. The largest incremental gain occurs when the input needs a fourth ChaCha block but uses only part of it. At 255 bytes, the final code saved 48.5% of CPU time on the M3 and 52.6% on the hosted Neoverse N2, relative to the previous four-lane patch. At 32 KiB, the refined code used 0.1% more CPU on the M3 and 0.7% more on Neoverse. [Raw samples and ranges](summary.csv)

## Source for review

The candidate is `e904cc1ba` on the fork. It carries the previous four-block implementation onto the current LibreSSL source mirror, then adds two commits. The first computes all four counters with vector additions and a carry mask. The second routes the fourth lane into the context’s keystream cache when 193–255 bytes remain after processing full 256-byte groups. It reads and writes only the caller’s remaining bytes and retains the unused keystream for the next call. [Counter change](https://github.com/rmilkowski/libressl-openbsd/commit/6b2028aff7a86f20acbba317fd9c0dcc35399154) · [Partial-block change](https://github.com/rmilkowski/libressl-openbsd/commit/e904cc1ba13ecac94d9941311f5edf7e43a3c433)

The source branch changes two existing files, the private cipher implementation and its public regression program. The two refinements together add 38 lines and remove 27 relative to the previous candidate. They operate within the little-endian AArch64 NEON guard. The regression adds lengths immediately around the new dispatch boundary, before and after a complete group. [Complete OpenBSD diff](chacha-aarch64-neon-refine.diff)

Both input files matched `openbsd/src` on 19 November. Applying the unified diff with `patch -p0` to clean copies of the base files reproduced both final files byte for byte. The base is `1a8bfb53b`, and the previous NEON source is `5259b312e`. This was AI-assisted development. The measurements and tests support human review. [Source identities](source-verification.json) · [OpenBSD submission route](https://github.com/libressl/openbsd) · [OpenBSD diff guidance](https://www.openbsd.org/faq/faq5.html#Diff)

## Cipher measurements

Each cell shows the median of 12 within-round CPU savings. A positive value means less CPU time. The M3 uses the SSH-style EVP call pattern, including its IV reset, against full LibreSSL dylibs. The Linux jobs use the public ChaCha API with an IV reset against isolated builds of the translation unit. Each three-build order occurs twice at each length. The warmup is excluded. The table reports all 18 lengths. [M3 samples](primitive-confirmation.jsonl) · [Arm Linux samples](hosted-arm64.csv) · [Intel Linux samples](hosted-x86_64.csv)

| Bytes | M3 vs previous NEON | M3 vs stock | Neoverse N2 vs previous NEON | Neoverse N2 vs stock |
| ---: | ---: | ---: | ---: | ---: |
| 4 | +2.0% | −0.3% | +0.6% | −0.3% |
| 32 | +1.7% | −0.1% | −2.3% | +0.8% |
| 64 | +2.5% | +0.1% | −0.8% | −1.4% |
| 128 | +1.1% | 0.0% | −0.3% | +0.6% |
| 191 | +0.7% | 0.0% | −1.2% | +0.1% |
| 192 | +0.7% | +0.1% | −0.2% | +0.8% |
| 193 | +49.2% | +48.9% | +54.5% | +54.3% |
| 224 | +48.8% | +48.6% | +53.5% | +53.9% |
| 255 | +48.5% | +48.0% | +52.6% | +53.2% |
| 256 | +0.1% | +47.0% | −0.7% | +52.7% |
| 257 | +0.3% | +39.1% | −0.6% | +40.3% |
| 448 | +0.5% | +28.2% | −0.2% | +29.7% |
| 449 | +32.0% | +48.3% | +37.4% | +53.5% |
| 511 | +31.5% | +48.3% | +37.0% | +52.8% |
| 512 | −0.6% | +46.6% | −0.7% | +52.6% |
| 4,096 | −0.7% | +46.4% | −0.7% | +52.5% |
| 32,768 | −0.1% | +46.8% | −0.7% | +52.4% |
| 131,072 | −0.1% | +45.8% | −0.4% | +51.2% |

The 255-byte CPU savings ranged from +47.0% to +50.6% on the M3 and +52.4% to +52.8% on Neoverse. At 32 bytes, Neoverse used 2.3% more CPU than the previous patch. Every 32 KiB Neoverse pair used 0.6% to 0.9% more CPU. On the Intel Xeon, the complete executable `.text` sections of all three test libraries were byte-identical. [Linux compiler and CPU identities](hosted-arm64.json) · [Intel machine-code hashes](hosted-x86_64.json)

## M3 transfer results

Each row covers six measured rounds of three 512 MiB loopback uploads and one excluded warmup per build. Six rounds put every build in every timing position twice. Time columns show medians for stock / previous NEON / refined, in that order. Percentage columns are medians of the within-round reductions. CPU combines both SSH endpoints’ user and kernel seconds. Elapsed time includes connection setup and shutdown. [Full transfer samples](matrix-confirmation.jsonl) · [Ranges and unrounded values](summary.csv)

| Transport and corpus | CPU seconds, stock / previous / refined | Wall seconds, stock / previous / refined | CPU saved vs previous | Wall saved vs previous | CPU saved vs stock | Wall saved vs stock |
| --- | ---: | ---: | ---: | ---: | ---: | ---: |
| SFTP, random uncompressed | 3.088 / 2.474 / 2.471 | 1.460 / 1.148 / 1.160 | −0.1% | −1.1% | +20.2% | +21.0% |
| SFTP, random compressed | 12.557 / 11.748 / 11.744 | 10.435 / 9.998 / 9.963 | +0.1% | +0.3% | +6.5% | +4.5% |
| SFTP, text compressed | 4.544 / 4.470 / 4.472 | 3.121 / 3.088 / 3.087 | 0.0% | +0.3% | +1.5% | +1.2% |
| Legacy SCP, random uncompressed | 3.274 / 2.602 / 2.610 | 1.456 / 1.146 / 1.121 | −0.2% | +1.1% | +20.4% | +23.2% |
| Legacy SCP, random compressed | 12.590 / 11.854 / 11.869 | 10.373 / 9.985 / 9.967 | −0.1% | +0.1% | +5.7% | +3.9% |
| Legacy SCP, text compressed | 4.687 / 4.624 / 4.625 | 3.090 / 3.077 / 3.067 | +0.1% | +0.3% | +1.3% | +0.9% |

Across all six transfer conditions, median CPU time ranged from 0.1% lower to 0.2% higher than the previous patch. For uncompressed SFTP, the full matrix measured −0.1% CPU and −1.1% elapsed savings over the previous NEON patch, with CPU savings ranging from −0.7% to +1.4%. A separate six-round SFTP confirmation measured +0.1% CPU and +0.7% elapsed savings over the previous patch. The two series are reported independently. All 147 uploads, including warmups, matched their independent SHA-256 checks. [Independent confirmation](sftp-confirmation.jsonl) · [Corpus hashes and round observations](matrix-environment.json)

The original 4.4.1 prototype measured 20.0% less CPU for uncompressed SFTP on the M1 Max and 18.2% less on the M3 versus their stock builds. The refined revision above was measured on the M3 and the hosted CPUs. The historical M1 numbers belong to a different revision. [Historical source and measurements](https://github.com/rmilkowski/libressl-openbsd/blob/0ad357b80c10af3910eca6ba974db73771eac418/benchmarks/macos/RESULTS.md)

## Correctness and portability

- The complete LibreSSL 4.4.1 macOS suite passed 145/145 for each of stock, previous NEON, and refined. The separate public regression passed with Apple Clang 21 and GCC 15. [Stock suite](validation/check-scalar.log) · [Previous suite](validation/check-reviewed.log) · [Refined suite](validation/check-refined.log) · [GCC result](validation/gcc-regress.log)
- The final code matched an independently compiled stock scalar implementation in 49,488 differential cases, including both key sizes, split and in-place operations, and 64-bit counter carry and wrap. Fatal ASan and UBSan runs passed. The expanded sweep covered 44,064 guard-page and 952,320 independent-alignment cases. [Differential check](validation/differential-sanitized.log) · [Expanded boundary check](validation/boundary-sweep.log) · [Validation manifest](validation/validation.json)
- The fork’s ten acceptance jobs passed. OpenBSD 8.0 arm64 executed the NEON and forced-scalar regressions in a VM, and OpenBSD 8.0 amd64 ran the scalar regression. Linux ran the upstream Portable recipe on arm64 and amd64, including arm64 Clang ASan with assembly enabled and disabled. Windows exercised shared and static MSVC builds on x64 and Win32. The two hosted timing jobs also passed. [OpenBSD arm64 execution](validation/openbsd-arm64.json) · [Acceptance jobs](https://github.com/rmilkowski/libressl-openbsd/actions/runs/44507292358) · [Hosted timing jobs](https://github.com/rmilkowski/libressl-openbsd/actions/runs/44507292360)
- The compiler selects NEON on little-endian AArch64 when SIMD is available. Big-endian AArch64, ARMv7, amd64, and AArch64 built with `-mgeneral-regs-only` took the scalar path in the standalone compile checks. Big-endian AArch64 and ARMv7 coverage was compile-only. The OpenBSD evidence is VM correctness coverage. Performance on physical OpenBSD/arm64 hardware remains unmeasured.

## Measurement conditions and alternatives

The Mac15,12 has an Apple M3, 24 GiB, macOS 27.2 (26B5112a), and Apple Clang 21.0.0. Its power samples showed AC with low-power mode off and no recorded thermal or performance warning. Desktop background load, fanless cooling and warm filesystem caches can affect results. Neither frequency nor temperature was continuously sampled. Linux timings used GCC 13.3 on hosted Neoverse N2 and Intel Xeon 6975P-C processors. [M3 build hashes and observations](timing-environment.json) · [Linux Arm sample environment](hosted-arm64.json)

LibreSSL used the pinned 4.4.1 release, `-O2 -g`, and the same configure hardening. Apple’s public OpenSSH 10.2p1 source used `-Os -g` and the original public-SDK adaptation for each build. Both endpoints linked the intended libcrypto and enabled EVP ChaCha. Every transfer used `chacha20-poly1305@openssh.com`. Corpus generation and hashing happened outside the timed interval. Conditions were shuffled with a recorded seed, and all six build orders were represented. [Reproduction instructions](REPRODUCE.md)

An earlier trial rewrote the common scalar tail. Hosted direct-API testing found roughly 7% more CPU at 32 KiB on Intel and 4.5% more on Neoverse than the previous patch. That result led to the AArch64-only refinement. Other trials varied the final-group buffer, counter setup, and output stores. The final numbers above use fresh measurements from the exact published source. [Superseded cross-platform trial](https://github.com/rmilkowski/libressl-openbsd/actions/runs/44505040456) · [Tail designs](https://github.com/rmilkowski/libressl-openbsd/actions/runs/44506051903) · [Counter and store comparison](https://github.com/rmilkowski/libressl-openbsd/actions/runs/44506670675)
