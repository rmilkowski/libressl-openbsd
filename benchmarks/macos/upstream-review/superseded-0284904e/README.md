# Superseded integration check

This is retained evidence for unpublished preparation candidate `0284904e`.
Its `!OPENSSL_NO_ASM` selection condition disabled the NEON C path in normal
LibreSSL Portable macOS/aarch64 builds, because Portable defines that macro when
no assembly backend is selected. The intrinsic helper itself passed standalone
correctness tests, but was inactive in the complete library.

The actual-library retiming retained here consequently measured essentially
scalar versus scalar: about 1.0% more median transfer CPU and 1.1% less elapsed
time, with essentially no primitive gain. It is not omitted as an outlier or
pooled with the corrected candidate. This is an identified build-selection
problem, fixed in `289dcecb` by distinguishing C intrinsics from assembly backends.

The old validation manifest/harness hashes remain reproducible, including the
original `OPENSSL_NO_ASM`-means-scalar expectation. These are superseded checks,
not the final upstream candidate's validation. Native OpenBSD execution was not
performed for either version.
