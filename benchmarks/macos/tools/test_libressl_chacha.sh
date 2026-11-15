#!/bin/sh
set -eu
cd "${SSH_PERF_ROOT:-/private/tmp/ssh-perf-work}"
base="$PWD/builds/libressl-current/install"
opt="$PWD/builds/libressl-neon/install"
"${CC:-cc}" -O2 -I"$base/include" scripts/test_libressl_chacha.c -o experiment/test_libressl_chacha
experiment/test_libressl_chacha "$base/lib/libcrypto.57.dylib" "$opt/lib/libcrypto.57.dylib"
# Instrument the actual changed translation unit and its streaming wrapper.
"${CC:-cc}" -O1 -g -fsanitize=address,undefined -fno-omit-frame-pointer -dynamiclib \
  '-DLCRYPTO_ALIAS(x)=' -I"$opt/include" libressl-neon/crypto/chacha/chacha.c \
  -o experiment/libchacha-sanitized.dylib
"${CC:-cc}" -O1 -g -fsanitize=address,undefined -fno-omit-frame-pointer -I"$base/include" \
  scripts/test_libressl_chacha.c -o experiment/test_libressl_chacha_sanitized
experiment/test_libressl_chacha_sanitized "$base/lib/libcrypto.57.dylib" "$PWD/experiment/libchacha-sanitized.dylib"
