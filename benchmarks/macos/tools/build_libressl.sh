#!/bin/sh
set -eu
root=${SSH_PERF_ROOT:-/private/tmp/ssh-perf-work}
variant=${1:-current}
case "$variant" in
  current) source="$root/libressl-portable" ;;
  neon) source="$root/libressl-neon" ;;
  *) echo 'Expected current or neon' >&2; exit 2 ;;
esac
mkdir -p "$root/builds/libressl-$variant"
cd "$root/builds/libressl-$variant"
lt_cv_sys_max_cmd_len=262144 "$source/configure" \
  --prefix="$root/builds/libressl-$variant/install" --enable-shared CFLAGS='-O2 -g' \
  > "$root/results/configure-libressl-$variant.log" 2>&1
make -j"${SSH_PERF_JOBS:-8}" > "$root/results/make-libressl-$variant.log" 2>&1
make install > "$root/results/install-libressl-$variant.log" 2>&1
