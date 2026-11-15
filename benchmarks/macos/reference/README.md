# Earlier M1 Max comparison

`m1-max-libressl-summary.csv` is the original controlled Apple-source OpenSSH
experiment, not a result produced by the new runner. Its patch comparison is
`apple-libressl-neon` against `apple-libressl` within the same condition.

- Apple M1 Max, arm64 macOS 27.0 build 26A428; Apple Clang 21 from Xcode-beta.
- LibreSSL 4.4.1 portable commit `c4a8f5f86d15b08eb2f5dfb2aa44e90a0c1f6a3d`;
  OpenBSD base `0fc62a7ccde3eed5e6825b9e54bd2a703b995a9d`.
- Apple OpenSSH source `2cc66abd7f8f1eb27d6a3074e476514194efe07e`, 10.2p1.
- Libraries use `-O2 -g`; SSH uses `-Os -g`, plus configure-selected hardening.
- 512 MiB loopback uploads, default SFTP, standard ChaCha20-Poly1305 cipher.
- One excluded warmup per condition and three measured runs, shuffled by round.
- CPU is client plus server user/kernel seconds; files are SHA-256 checked.
- Warm caches; no fsync, affinity, cold-cache control or unrelated-activity control.

The patch saved about 20.0% total CPU and 18.8% elapsed time for uncompressed
random transfers. The compressed conditions did not establish a consistent gain;
a separate five-pair compressed-random confirmation saved 1.0% CPU but took 6.8%
more wall time. Do not pool that confirmation with this CSV's main matrix.

The NEON patch alone saved about 54.2% CPU in the 32 KiB EVP primitive test. It did
not establish 40% CPU savings for complete transfers. No energy claim was made.

The CSV also includes native-library and OpenSSL references from the original
experiment; those are not part of the new runner's two-variant comparison.
For a tighter cross-machine comparison, run the new harness on both Macs and
retain compiler, OS, power, workload and repetition differences in the report.
