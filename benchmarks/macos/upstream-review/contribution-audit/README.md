# Contribution and CI audit — 2026-11-15

Source candidate: `5259b312e7d54bbcde9d13537f083dcd669c2cbb`, based on
`86ac60737a5b1465eb76b38f9edbe86d12f27497`. The submission branch is
`upstream/chacha-aarch64-neon`; it still changes only the implementation and
its existing regression program. Benchmark records and this audit stay on
`experiment/libressl-4.4.1-neon`.

## What the project actually requests

| Topic | Evidence and consequence for this patch |
|---|---|
| Contribution route | The [source mirror's description](https://github.com/libressl/openbsd) directs source changes to the OpenBSD CVS tree, as patches emailed to `tech@openbsd.org`, rather than pull requests to that mirror. This is a crypto implementation change, so that route applies. |
| Base and diff | The [OpenBSD FAQ](https://www.openbsd.org/faq/faq5.html#Diff) requests a diff against -current, with context, preserved whitespace, and no Git `a/` or `b/` prefixes. Our combined diff is relative to `src`, disables rename detection, and reproduces both committed files when applied with `git apply -p0`. Recheck -current before submission. |
| Mail | [Mailing-list guidance](https://www.openbsd.org/mail.html) calls for plain text and useful subjects. Keep explanatory prose wrapped and put the diff inline. The supplied mail remains an unsent draft. |
| Code style | [style(9)](https://man.openbsd.org/style.9) describes preferred userspace KNF: tabs, four-space continuations, 80 columns, grouped/ordered declarations, private static functions, and safe compound macros. Apply those conventions to our additions without reformatting inherited scalar code. |
| Scope and reviewability | The [Portable README](https://github.com/libressl/portable/blob/e255d870a0182f107d7e3ebca0744c24dd920e89/README.md) emphasizes clean, high-quality code and simplicity. The proposal adds a private intrinsic-C helper and public-API regressions; it introduces no new interface, dependency, exported symbol, build generator, or platform assembly file. |
| Copyright | [OpenBSD policy](https://www.openbsd.org/policy.html) addresses contribution rights and prefers ISC for new code. Existing public-domain/ISC notices are preserved. Tests and formatting do not decide provenance acceptance. |
| Repository-specific extras | Neither the reviewed mirror tree nor current Portable tree contains a `CONTRIBUTING` file, `AGENTS.md`, `.clang-format`, mandatory commit template, DCO/sign-off requirement, or AI-specific contribution rule. This is a finding about those inspected trees, not a statement about every OpenBSD developer's preferences. |

The broader OpenBSD [AI-provenance discussion](https://marc.info/?l=openbsd-tech&m=177411620801633&w=2)
concerns another proposed change. It demonstrates a possible acceptance concern;
it does not establish a blanket LibreSSL-specific ban. The submission draft
discloses Codex implementation assistance and Astra model review without
claiming human authorship, maintainer approval, or a project `Reviewed-by`.

## Recent practice and commit messages

The source mirror history was deepened by 250 commits for this audit. Useful
recent examples include:

- [`86ac60737`](https://github.com/libressl/openbsd/commit/86ac60737a5b1465eb76b38f9edbe86d12f27497): a narrow MSVC warning fix, explaining the affected ABI and linking Portable regression evidence.
- [`111667564`](https://github.com/libressl/openbsd/commit/111667564f41c22ee89cff49804981a363505764): runtime fixes with a related regression adjustment, explaining the UBSan trigger.
- [`8caf0e12f`](https://github.com/libressl/openbsd/commit/8caf0e12fd809337c405f8dd0952f093cfd37e6b): a focused change to existing architecture scripts, with reason and attribution.
- [`41fad2f74`](https://github.com/libressl/openbsd/commit/41fad2f74): a larger implementation explaining its specification and imported origin. Its scale is not a requirement for this small optimization.

These examples use concise subjects and ordinary explanatory bodies, usually
wrapped. Some include genuine maintainer `ok` lines. They do not establish a
mandatory Conventional Commits prefix, issue number, trailer, or fixed subject
length. The [temporary Portable PR #1464](https://github.com/libressl/portable/pull/1464)
was explicitly a test vehicle, closed without merging after the fix went into
OpenBSD; it is not an example of submitting core code to the mirror.

The [AArch64 assembly discussion in #1226](https://github.com/libressl/portable/pull/1226#discussion_r3076766603)
shows maintainers questioning cross-platform indirection and build complexity.
Keeping this proposal in existing C files avoids adding that particular burden.
That is an inference about reviewability, not maintainer endorsement of our
approach or evidence that this exact optimization was previously accepted.

The original published commit had overly long body lines. Its history was
preserved; the follow-up uses wrapped prose. `../upstream-commit-message.txt`
provides a wrapped message for a combined upstream commit. No invented approval
trailers are supplied.

## Changes made during this audit

- Normalize new declaration ordering and macro continuation alignment.
- Reject invalid cache lengths in `chacha_ctx_equal()` before cache-pointer
  arithmetic, so an implementation regression cannot make its comparator read
  outside the context.
- Measure the regression's scalar cost: three complete runs took
  0.503–0.512 seconds on M1 Max. These timings were collected during build
  activity to check test-suite cost, not to benchmark cipher performance.
- Regenerate the combined two-file diff and verify exact application.
- Prepare and lint isolated CI infrastructure, including candidate-file and
  commit identity checks. It is excluded from the proposed source patch.

No cipher arithmetic or dispatch behavior changed from `289dcecb`. Separately
compiled `-O2` Mach-O objects have byte-identical `__text` sections under the
same compiler and public headers. The historical performance records still
identify `289dcecb`; they are not relabeled as fresh measurements of `5259b312`.

## What upstream CI runs

The pinned current Portable checkout is
`e255d870a0182f107d7e3ebca0744c24dd920e89`. Its rolling `VERSION` file says
4.4.0; this is current development code, not a new test of the old 4.4.0 release.
Exact workflow blobs and `scripts/test` are preserved in `workflow-snapshot/`
and identified by `workflow-snapshot.json`.

| Workflow | Relevant checks |
|---|---|
| [macOS](https://github.com/libressl/portable/blob/e255d870a0182f107d7e3ebca0744c24dd920e89/.github/workflows/macos.yml) | Three macOS/Xcode images, arm64 and x86-64; Autotools `distcheck`, then CMake static/shared builds and tests through `scripts/test`. |
| [Linux](https://github.com/libressl/portable/blob/e255d870a0182f107d7e3ebca0744c24dd920e89/.github/workflows/linux.yml) | Native GCC/Clang; multiple cross architectures including ARM32/64, MinGW, MIPS, RISC-V and LoongArch. Native recipes use `distcheck` and CMake/Ninja static/shared. Clang ASan jobs cover x86-64 and arm64 with CMake assembly enabled/disabled. |
| [Windows](https://github.com/libressl/portable/blob/e255d870a0182f107d7e3ebca0744c24dd920e89/.github/workflows/windows.yml) | MSVC x64/Win32 and ARM64, static/shared, CMake and CTest. Our supplemental run covers x64/Win32, not the complete OS/compiler matrix. |
| [CMake config](https://github.com/libressl/portable/blob/e255d870a0182f107d7e3ebca0744c24dd920e89/.github/workflows/cmake-config.yml) | Build/install and consume exported targets from the build directory and both installed-package discovery mechanisms. |
| Android | Minimum API 26 and latest NDK; builds x86, x86-64 and arm64. These are build checks, not emulator execution in that workflow. |
| Emscripten | Build and CTest on the current emsdk. |
| Scheduled/manual jobs | FreeBSD Autotools/CMake, Solaris Autotools, Fedora GCC/Clang, rust-openssl integration, CIFuzz, and a project-only Coverity scan. They are not all PR gates. |
| Release | Release creation and packaging, not a lint or per-patch regression requirement. |

No formatting or source-linter job was found in these workflow files. The
OpenBSD `chacha/Makefile` itself enables warnings and `-Werror`, and links the
existing regression against libcrypto. Therefore the new coverage belongs in
that existing program, rather than a benchmark-only executable.

## Checks executed for this exact source revision

Local results:

| Check | Result |
|---|---|
| Added-line style, `git diff --check` | Pass; no added source line exceeds 80 columns. |
| Supplemental `knfmt -Dds` on the aggregate diff | No suggested changes, using `mptre/knfmt` commit `8d1471503fd8eb85cc4551814136351750b52583`. This is an extra check, not a project-mandated linter. |
| Actual current macOS `scripts/test`, arm64 | Pass: `distcheck` 149/149, CMake static 149/149, CMake shared 149/149; no skips in Autotools. |
| Current CMake x86-64 static/shared under Rosetta | Each passes 149/149. This checks Intel code execution through translation, not native Intel hardware performance. |
| CMake package consumer builds | Build-tree, installed prefix, and installed `LibreSSL_DIR` cases all build Crypto/SSL/TLS consumers. Local package came from the CI-recipe build; it was not a separate fresh Release-library build. |
| Cipher translation unit, `-Wall -Wextra -Werror` | Pass. Regression compilation also passes, suppressing only its pre-existing unused-parameter warnings. |
| Supplemental Clang static analyzer | No diagnostics for the cipher translation unit or regression program. This does not replace Coverity or a security proof. |
| Standalone original-scalar comparisons | Public regressions, 7,200 protected-page cases, 165,888 independent-alignment cases, and 49,488 broader differential cases pass. |
| Fatal ASan/UBSan and fallback selection | Pass, including the expected-failure UBSan control and all seven compile-selection configurations. |
| CI workflow `actionlint` | Pass with actionlint 1.7.12. |

Full compressed build/test logs, source hashes, analyzer output, runtime samples,
and standalone validation receipts accompany this audit. The first local
Autotools attempt failed because the separately installed Automake could not
find Homebrew's libtool macros; setting `ACLOCAL_PATH` fixed that environment
issue. An initial consumer command referenced a directory excluded from the
distribution tarball; using the original checkout's `tests/cmake` fixed that
command. Those failed attempts are retained rather than reported as patch
failures or hidden.

The [corrected acceptance run](https://github.com/rmilkowski/libressl-openbsd/actions/runs/43746096344)
passed **10/10 jobs**. Exact job links and receipts are recorded in
`github-results.json`:

| Executed GitHub configuration | Result |
|---|---|
| Linux GCC x86-64 and arm64 | Each passes `distcheck`, static CMake and shared CMake: 149/149 tests per suite. |
| Linux arm64 Clang ASan, CMake assembly on/off | Both configurations pass the same three suites, 149/149 each. |
| Windows MSVC x64/Win32, static/shared | Four configurations, 145/145 tests each. |
| OpenBSD 8.0 amd64/arm64 VM, Clang 22.1.6 | Actual translation unit and public regression pass; arm64 also verifies NEON selection and executes the scalar fallback. |

The CI branch
contains the same two source files as `5259b312` plus test infrastructure:
[`ci/chacha-aarch64-neon-acceptance`](https://github.com/rmilkowski/libressl-openbsd/tree/ci/chacha-aarch64-neon-acceptance).
It is a test branch in the user's fork, not a submission to upstream. Linux
jobs run the pinned upstream recipe; OpenBSD VM jobs execute the actual ChaCha
translation unit and regression with native OpenBSD headers/ABI. Those VM jobs
are not a full OpenBSD base-system build, -current validation, a native-hardware
benchmark, or a full libcrypto regression run.

The initial Windows jobs stopped at the strict source comparison before
compilation because checkout line-ending conversions differed. The corrected
workflow forces canonical LF checkouts and retains `cmp`, commit-identity,
architecture, and nonempty-test assertions. Failed runs are retained with the
eventual corrected results.

All four corrected Windows configurations pass 145/145 tests, including
`chachatest`. MSVC emits warnings in unchanged TLS, X.509 and other test/app
files; the logs contain no compiler warnings from the two changed ChaCha files.
This is not a claim that the whole upstream build is warning-free.

For Linux ASan no-assembly jobs, `ENABLE_ASM=OFF` affects the CMake builds in
`scripts/test`; its Autotools `configure`/`distcheck` still use defaults. The
separately recorded 4.4.1 explicit Autotools `--disable-asm` validation is a
different check.

## Remaining acceptance work

Passing these checks improves technical evidence; it cannot guarantee that the
project wants this implementation. Before sending, refresh -current, review the
entire final diff personally, preserve honest assistance attribution, and use
the inline mail route. Native OpenBSD -current integration and representative
ARM hardware performance, compiler-version coverage, and all unexecuted
Portable CI targets remain useful independent validation. The OpenBSD compiler's
different unaligned-access code generation and larger stack frame remain
explicit review topics; no OpenBSD performance gain is claimed.

Astra's final independent package review found **no unresolved actionable
issues**. It reconciled the source/diffs, evidence hashes and all ten CI job
results. See [the review record](../ASTRA-REVIEW.md) for scope and iterations.
