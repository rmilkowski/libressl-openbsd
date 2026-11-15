# Astra review record

Reviewer: the user-requested `gpt-6-astra` model, in a separate read-only review
agent. This is an AI technical review, not an OpenBSD maintainer approval or an
independent human cryptographic audit. No project `Reviewed-by` endorsement is
asserted.

Initial cleaned candidate: `289dcecb0ba0a7a740dc2435f80e8d557d10f0e9`.
Current source candidate: `5259b312e7d54bbcde9d13537f083dcd669c2cbb`.
Base: `86ac60737a5b1465eb76b38f9edbe86d12f27497`.

## Review iterations

1. The original Apple-only prototype required portable target selection, KNF
   cleanup, focused upstream regressions and stronger boundary/state evidence.
   The helper was reformatted, eligible targets made explicit, the scalar path
   preserved and regression tests added. Existing carry/cache behavior was
   reviewed rather than assumed.
2. Astra found that the supplemental script could let recovering UBSan findings
   exit successfully. All sanitizer compilations now use
   `-fno-sanitize-recover=all`; an intentional overflow negative control must fail.
   The tests were rerun and Astra verified clean logs and matching hashes.
3. An actual-library performance check exposed a preparation integration bug:
   candidate `0284904e` disabled intrinsic C when Portable automatically defined
   `OPENSSL_NO_ASM` on macOS/aarch64. Its standalone tests had exercised the
   helper but its normal Portable library did not. The final candidate removes
   that coupling, documents why, and retains compiler-feature-based scalar
   fallback. The superseded evidence and unfavorable retiming remain available.
4. Astra reviewed the replacement commit, actual Portable preprocessing and
   objects, full normal/explicit-no-assembly library tests, full-library bounds
   comparisons and complete v3 standalone validation evidence. Both real
   Portable configurations enable the helper; disabled-NEON targets retain the
   scalar path.

## Final technical decision

Astra reported **no unresolved blocking technical findings** in the replacement
candidate within the reviewed implementation, regression and supplemental
validation scope. It verified the Portable activation correction, fatal sanitizer
behavior, state/bounds comparisons and evidence hashes.

The helper keeps twenty rounds, the legacy 64-bit counter/nonce construction,
counter carry/wrap, exact in-place operation, and live streaming-cache state.
Public API/context layout/export names are unchanged. Assembly inspection found
fixed round/length loops and a fixed register-table rotation mask, not a formal
proof of constant-time execution.

That initial review left native OpenBSD execution/performance unverified and
did not resolve maintainer acceptance of AI-assisted provenance. OpenBSD-target
cross code generation differs from macOS and needs native evaluation. Historical
M1/M3 numbers must not be generalized to native OpenBSD or reassigned to a changed
candidate. The separate final M1 confirmation and interoperability records are
identified as additional evidence rather than pooled into historical results.

Astra's final package check independently recalculated the five-pair transfer
reductions (21.0824% CPU and 20.5183% elapsed), the 32 KiB primitive reduction
(54.517% CPU), all 32 distinct compatibility combinations, and exact agreement
of the standalone and inline-mail diffs with the candidate. It found no
actionable documentation/evidence inconsistency. Its optional request to explain
the normal disconnect status 255 in passing records is addressed in the README.

## Contribution and CI audit follow-up

Astra separately examined the new source cleanup and actual recent conventions.
It requested ordered declarations, wrapped submission prose, and a cache-length
bounds check in the regression comparator. These were fixed in `5259b312`; the
aggregate source diff passes `git diff --check` and supplemental `knfmt -Dds`.
The published original commit was preserved and a wrapped combined submission
message was prepared, rather than falsely claiming its history was rewritten.

Astra reviewed the isolated CI workflow and requested strict exported-file and
commit identity checks, nonempty CTest discovery, expected VM architecture, and
verification of scalar selection with `-mgeneral-regs-only`. Those assertions
were added. It also accepted the subsequent Windows LF-checkout correction,
which preserves exact source comparisons rather than weakening them.

The expanded checks and their exact results are documented in
[contribution-audit](contribution-audit/README.md). OpenBSD 8.0 amd64 and arm64 VM
execution closes the translation-unit execution gap for that release/ABI; it
does not establish a full -current integration build or performance on native
OpenBSD hardware. The existing 289dcecb performance measurements keep their
original attribution.

Final follow-up decision: Astra reported **no unresolved actionable issues** for
`5259b312e7d54bbcde9d13537f083dcd669c2cbb`. It independently verified all
89 audit-file hashes, all 31 standalone-validation hashes, committed source
hashes, exact correspondence of the supplied standalone/inline diffs, and log
support for all ten successful CI jobs. It found the contribution claims,
assistance disclosure, historical performance attribution and remaining
validation limits accurately distinguished. This review decision is recorded
after verification; it remains an AI review, not upstream approval.
