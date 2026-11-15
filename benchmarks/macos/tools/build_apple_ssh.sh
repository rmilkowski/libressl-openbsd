#!/bin/sh
set -eu
root=${SSH_PERF_ROOT:-/private/tmp/ssh-perf-work}
# Apple's checked-in config.h targets its internal SDK and would override
# per-library out-of-tree configure results through includes.h's local search.
if [ -f "$root/apple-openssh/openssh/config.h" ]; then
  mv "$root/apple-openssh/openssh/config.h" "$root/apple-openssh/openssh/config.h.apple-original"
fi
variant=${1:?Specify apple-native, apple-libressl, apple-libressl-neon, or apple-openssl}
case "$variant" in
  apple-native) crypto="$root/builds/macos-crypto-sdk" ;;
  apple-libressl) crypto="$root/builds/libressl-current/install" ;;
  apple-libressl-neon) crypto="$root/builds/libressl-neon/install" ;;
  apple-openssl) crypto=/opt/homebrew/opt/openssl@3 ;;
  *) exit 2 ;;
esac
mkdir -p "$root/builds/$variant"
cd "$root/builds/$variant"
# Published configure-for-osx.sh options, replacing the internal-SDK libcrypto
# paths with a local prefix. Private Xcode-only features are not enabled.
"$root/apple-openssh/openssh/configure" --with-pam --with-audit=bsm \
  --with-kerberos5=/usr --disable-libutil --disable-pututline \
  --with-default-path=/usr/bin:/bin:/usr/sbin:/sbin \
  --with-ssl-dir="$crypto" \
  --with-privsep-path=/var/empty --with-privsep-user=_sshd \
  --prefix="$root/builds/$variant/install" CFLAGS='-Os -g' \
  > "$root/results/configure-$variant.log" 2>&1
make -j"${SSH_PERF_JOBS:-8}" > "$root/results/make-$variant.log" 2>&1
mkdir -p install/libexec
for program in sshd-session sshd-auth sftp-server; do
  if [ -f "$program" ]; then ln -sf "$root/builds/$variant/$program" "install/libexec/$program"; fi
done
