# Prepared ChaCha review candidate

The minimal crypto/regression candidate is commit
`5259b312e7d54bbcde9d13537f083dcd669c2cbb` on branch
[`upstream/chacha-aarch64-neon`](https://github.com/rmilkowski/libressl-openbsd/tree/upstream/chacha-aarch64-neon).
It is based on fetched LibreSSL/OpenBSD master
`86ac60737a5b1465eb76b38f9edbe86d12f27497`. Both modified base files were also
verified to match the corresponding `openbsd/src` master blobs on 2026-11-15;
their identities are recorded in `evidence/upstream-snapshot.json`.

The subsequent [contribution and CI audit](contribution-audit/README.md) records
the current requirements, recent patch conventions, style fixes and expanded
cross-platform tests for this revision. OpenBSD 8.0 VM execution now covers the
actual ChaCha translation unit and regression on amd64/arm64; a full OpenBSD
-current integration build and native-hardware performance remain unverified.
This is a technically reviewed candidate, **not an assertion of upstream
acceptance or production readiness**. No email or upstream pull request has been
submitted.

## Submission shape and conventions

[`chacha-aarch64-neon.diff`](chacha-aarch64-neon.diff) contains only two files:

- `lib/libcrypto/chacha/chacha-merged.c`: the private SIMD helper and selection.
- `regress/lib/libcrypto/chacha/chachatest.c`: focused public-API regressions.

The benchmark harnesses, performance reports, review notes and logs in this
directory are supporting evidence, not part of that proposed source diff.
The original experiment branch and historical M1/M3 measurements retain their
original implementation. Do not relabel those measurements as tests of this
cleaned candidate, especially on the M3 where it has not been executed.

OpenBSD asks for a diff against -current, without `a/` and `b/` prefixes, inline
in plain-text mail to `tech@openbsd.org`. The supplied diff is relative to the
OpenBSD `src` directory and applies with `git apply -p0`. It was applied to clean
copies of both base files and reproduced the committed candidate byte-for-byte.
Recheck -current before sending. It was generated from the candidate worktree:

```sh
cd /path/to/candidate/src
git -c diff.noprefix=true -c diff.renames=false diff \
  86ac60737a5b1465eb76b38f9edbe86d12f27497 \
  5259b312e7d54bbcde9d13537f083dcd669c2cbb --relative .
```

The new code follows the surrounding OpenBSD KNF conventions, with tabs, grouped
declarations, bounded line lengths, private helper naming, and comments explaining
lane layout and counter semantics. Existing public-domain/ISC notices are
preserved; no assertion of independent human authorship or new licensing rights
has been added. That preservation does not resolve the new contribution's
provenance question.

## Implementation

Four full 64-byte blocks are computed across four NEON lanes, using all twenty
ChaCha rounds and the existing 64-bit counter/nonce convention. Counter carry and
modulo-2^64 wrap are preserved, as are both existing key sizes. Short inputs and
tails use the original scalar implementation. The public wrapper continues to
consume cached keystream before entering block processing.

Selection requires AArch64, compiler-advertised `__ARM_NEON`, and explicit
little-endian byte order. Other configurations keep
the unchanged scalar code without including `arm_neon.h`. In particular,
`-mgeneral-regs-only`, big-endian AArch64, ARMv7 and x86-64 select scalar code.
This uses baseline Advanced SIMD rather than optional ARM crypto extensions;
there is no SIGILL capability probe or new runtime dispatcher.

`OPENSSL_NO_ASM` disables assembly backends, not this compiler-intrinsic C
implementation. In Portable 4.4.1, a normal macOS/aarch64 build defines that macro
automatically because it has no assembly backend; treating it as a SIMD opt-out
would disable the new path in the very configuration being optimized. Explicit
`--disable-asm` builds also use NEON C when the compiler advertises it. Compile
with `-mgeneral-regs-only` to select scalar code without permitting Advanced SIMD.
Both full Portable configurations and their actual compiled objects are checked.

There are no public API, context layout, exported-symbol, round-count, protocol,
key-format, compression or transfer-concurrency changes. No OpenSSL or Linux
assembly has been imported into this diff.

## Initial cleanup validation and reproducibility

The preparation results in this section identify `289dcecb`. The later
[audit](contribution-audit/README.md) reruns the standalone checks for exact
revision `5259b312`, adds current Portable CI-recipe builds with 149 tests,
and records cross-platform execution. Historical logs remain unchanged.

The proposed public regression compares bulk output and resulting live state
against single-byte calls, which cannot reach the bulk implementation. It covers
18 selected lengths through 1024, both key sizes, zero/nonzero input, all sixteen
matching byte alignments, six counter starts including carry and wrap, every
possible cached-prefix length, exact in-place split writes, zero-length cached
calls, continued output and the public one-shot interface. Dead cache bytes are
deliberately excluded from state comparisons.

Supplemental checks use an independently compiled **original scalar source**
from the base commit, not an alternative invocation of the candidate helper:

| Check | Result on M1 Max/macOS |
|---|---|
| Complete LibreSSL 4.4.1 suite, with new regression included | 145/145 pass |
| Public ChaCha/HChaCha/XChaCha and new bulk regression | Pass with original scalar, candidate, no-asm and no-NEON libraries |
| Protected-page inputs/outputs, start/end boundaries, in-place/split/cache/continuation | 7,200 cases pass |
| Independently varied input/output alignments, both key sizes, zero/nonzero data, counter carry/wrap | 165,888 cases pass |
| Earlier broad differential suite against original scalar | 49,488 cases pass |
| ASan/UBSan bounds, alignment, differential and public regressions | Pass; sanitizer failures are fatal |
| Deliberate UBSan overflow control | Fails as required, confirming non-recovery |
| Installed headers and exported symbol names | 69 headers byte-identical; 3,263 symbol names identical |
| Cross-compilation and compile-time path selection | Pass for all seven configurations in `validation.json` |

The protected-page tests cover 27 selected lengths through 4096, separate and
in-place buffers, input/output at either end of an accessible page, and prefixes
0, 1 and 63 where valid. Inputs are read-only during separate-buffer encryption;
surrounding pages are inaccessible and output sentinels are checked.

ASan/UBSan instrument the actual candidate translation unit and wrapper. Every
sanitizer build uses `-fno-sanitize-recover=all`; the intentional overflow control
must fail with its expected diagnostic. That control's error log is expected and
is separate from the clean crypto test logs. Astra identified the original
recovery weakness; it was fixed and the complete validation rerun.

The standalone matrix cross-compiles the translation unit for OpenBSD/aarch64,
Linux/aarch64, big-endian Linux/aarch64, OpenBSD/x86-64 and Linux/ARMv7, plus
OpenBSD/aarch64 no-asm/no-NEON variants. Runtime fallback tests execute natively
on macOS. Cross-compilation uses installed macOS LibreSSL public headers and is
**not** a full native build or execution of OpenBSD or Linux.

The full Portable default build and an explicit `--disable-asm` build each pass
145/145 library tests with the proposed regression included. Their actual ChaCha
objects contain the eight register-table rotations from the NEON round loop;
the original scalar object's count is zero. Preprocessing the actual default
compile command confirms both `OPENSSL_NO_ASM` and `CHACHA_USE_NEON` are defined.
Full-library output/state/bounds tests also pass for both configurations.

An earlier preparation candidate, `0284904e`, incorrectly tied intrinsic C to
`OPENSSL_NO_ASM`. Standalone correctness checks passed, but an actual-library
performance run showed essentially no gain because Portable suppressed SIMD.
The guard was corrected and the affected tests repeated. The superseded source,
harness hashes, validation and unfavorable retiming are retained under
`superseded-0284904e/`; they are not results for the final candidate.

To reproduce the supplemental validation on native Apple Silicon macOS, provide
the candidate checkout, installed LibreSSL 4.4.1 public headers, and a new output
directory. The original scalar source is read from Git, and nothing is installed
into system library locations:

```sh
sh benchmarks/macos/upstream-review/validate.sh \
  /path/to/candidate-checkout \
  /path/to/libressl-4.4.1-install/include \
  /private/tmp/libressl-review-validation
```

Use the benchmark branch for this script and a separate checkout/worktree of the
candidate branch for the first argument. `evidence/validation.json` hashes all
recorded validation files. `evidence/harness-sha256.json` identifies the supplied
harness and diff. Executables, test keys and file corpora are not published.

## Corrected candidate's M1 Max confirmation

After the Portable activation correction, the final candidate was retested with
the same complete locally built libraries and Apple-source SSH recipe. Five
measured pairs of 512 MiB uncompressed random SFTP uploads followed one excluded
warmup pair, with variant order alternating. No other builds or tests were run
in parallel with timing; the Mac was not an isolated benchmark host.

| Metric | Unchanged 4.4.1 | Final candidate | Reduction |
|---|---:|---:|---:|
| Transfer CPU seconds | 4.884 | 3.854 | 21.1% |
| Transfer elapsed seconds | 2.287 | 1.818 | 20.5% |
| 32 KiB primitive CPU microseconds | 53.61 | 24.39 | 54.5% |

All 32 compatibility transfers passed against stock Apple OpenSSH 10.3p1 and
the unchanged-library 10.2p1 rebuild: each peer as client/server, both directions,
compression on/off, default/legacy SCP, with rekeying requested at 1 MiB.
Every destination passed SHA-256 verification. These compatibility transfers
are not compressed-performance measurements.

Some raw records contain `server_status: [255]`: the harness accepts that only
with its checked normal user-disconnect log, successful client exit and matching
file checksum. It does not represent a failed transfer in these passing records.

The final run, medians/ranges, raw records, metadata and post-run binary/library
fingerprints are in [m1-max-final-confirmation](m1-max-final-confirmation/).
`retest.py` records the orchestration used with the already prepared local work
directory. Source/compile versions and cooling/scheduling differences limit any
comparison with the historical runs. No new M3 measurement or new compression
speedup is claimed for this final revision, and these data are not pooled with
the earlier experiments.

## Review decision and remaining limits

The user requested an independent Astra model review. Astra initially reviewed
immutable candidate `289dcecb`, its minimal diff, regression tests, supplemental harness,
validation hashes and generated macOS/OpenBSD-target assembly. After the UBSan
fix and rerun it reported **no unresolved blocking technical findings within that
scope**. This is an AI review, not an OpenBSD maintainer approval, human security
audit, formal proof or `Reviewed-by` endorsement from the project.

Generated macOS SIMD code has fixed round-count/length loops, a fixed register
shuffle mask and no calls in the bulk region. Some original state values are
spilled for feed-forward. The OpenBSD-target cross assembly lowers unaligned byte
loads/stores less efficiently and uses a larger stack frame. It still needs
OpenBSD -current/full-library integration and representative native-hardware
performance validation; no OpenBSD speedup is claimed.
Source and assembly inspection do not prove constant-time execution.

The new audit also covers declaration ordering, defensive regression-state
checks, commit-message wrapping and actual CI recipes. Astra reviewed those
changes and the supplemental workflow. Its final record is in
[ASTRA-REVIEW.md](ASTRA-REVIEW.md).

OpenBSD's public copyright guidance prefers ISC for new code and requires rights
to contributed material. A broader OpenBSD discussion rejected another AI-code
submission over provenance concerns; no LibreSSL-specific blanket AI ban was
found in the inspected repository guidance. The unsent mailing-list draft
discloses Codex assistance and Astra model review. Tests and formatting do not
decide maintainer acceptance, and any human review or reimplementation must
remain honest about the origin of the work.

References: [OpenBSD diff preparation](https://www.openbsd.org/faq/faq5.html#Diff),
[style(9)](https://man.openbsd.org/style.9),
[mailing-list conventions](https://www.openbsd.org/mail.html),
[LibreSSL source contribution route](https://github.com/libressl/openbsd),
[copyright policy](https://www.openbsd.org/policy.html),
[developer discussion of AI provenance](https://marc.info/?l=openbsd-tech&m=177411620801633&w=2).
