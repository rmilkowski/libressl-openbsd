#!/bin/sh
# Supplemental checks for an immutable candidate commit, run on native arm64 macOS.
set -eu
source_repo=${1:?Usage: validate.sh SOURCE_REPO PUBLIC_INCLUDE OUTPUT_DIR}
include=${2:?Specify installed LibreSSL public include directory}
output=${3:?Specify an empty output directory without spaces}
here=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
base=86ac60737a5b1465eb76b38f9edbe86d12f27497
cc=/usr/bin/clang
if [ -e "$output" ]; then
  echo "Use a new output directory; existing evidence is retained: $output" >&2
  exit 1
fi
mkdir -p "$output/scalar" "$output/candidate" "$output/cross"
output=$(CDPATH= cd -- "$output" && pwd)
source_repo=$(CDPATH= cd -- "$source_repo" && pwd)
include=$(CDPATH= cd -- "$include" && pwd)
commit=$(git -C "$source_repo" rev-parse HEAD)
git -C "$source_repo" diff --exit-code HEAD -- src/lib/libcrypto/chacha \
  src/regress/lib/libcrypto/chacha > "$output/working-tree-check.log"
for file in chacha.c chacha-merged.c; do
  git -C "$source_repo" show "$base:src/lib/libcrypto/chacha/$file" > "$output/scalar/$file"
  git -C "$source_repo" show "$commit:src/lib/libcrypto/chacha/$file" > "$output/candidate/$file"
done
git -C "$source_repo" show "$commit:src/regress/lib/libcrypto/chacha/chachatest.c" > "$output/chachatest.c"
"$cc" --version > "$output/compiler.txt"
printf '%s\n' "$base" > "$output/base.txt"
printf '%s\n' "$commit" > "$output/commit.txt"

"$cc" -O2 -dynamiclib '-DLCRYPTO_ALIAS(x)=' -I"$include" \
  "$output/scalar/chacha.c" -o "$output/scalar.dylib"
"$cc" -O2 -dynamiclib '-DLCRYPTO_ALIAS(x)=' -I"$include" \
  "$output/candidate/chacha.c" -o "$output/candidate.dylib"
"$cc" -O2 -DOPENSSL_NO_ASM -dynamiclib '-DLCRYPTO_ALIAS(x)=' -I"$include" \
  "$output/candidate/chacha.c" -o "$output/no-asm.dylib"
"$cc" -O2 -mgeneral-regs-only -dynamiclib '-DLCRYPTO_ALIAS(x)=' -I"$include" \
  "$output/candidate/chacha.c" -o "$output/no-neon.dylib"
"$cc" -O2 -Wall -Wextra -Werror -I"$include" "$here/test_bounds.c" -o "$output/test_bounds"
"$cc" -O2 -I"$include" "$here/../tools/test_libressl_chacha.c" -o "$output/test_differential"
for variant in scalar candidate no-asm no-neon; do
  "$cc" -O2 -Wall -Wextra -Werror -Wno-unused-parameter -I"$include" \
    "$output/chachatest.c" "$output/$variant.dylib" -o "$output/regress-$variant"
  "$output/regress-$variant" > "$output/regress-$variant.log" 2>&1
  printf 'PASS public ChaCha/HChaCha/XChaCha and bulk regress: %s\n' "$variant" >> "$output/regress-$variant.log"
done
for variant in candidate no-asm no-neon; do
  "$output/test_bounds" "$output/scalar.dylib" "$output/$variant.dylib" > "$output/bounds-$variant.log" 2>&1
done
"$output/test_differential" "$output/scalar.dylib" "$output/candidate.dylib" > "$output/differential.log" 2>&1

"$cc" -O1 -g -fsanitize=address,undefined -fno-sanitize-recover=all \
  -fno-omit-frame-pointer -dynamiclib \
  '-DLCRYPTO_ALIAS(x)=' -I"$include" "$output/candidate/chacha.c" -o "$output/sanitized.dylib"
"$cc" -O1 -g -fsanitize=address,undefined -fno-sanitize-recover=all \
  -fno-omit-frame-pointer -I"$include" \
  "$here/test_bounds.c" -o "$output/test_bounds_sanitized"
"$output/test_bounds_sanitized" "$output/scalar.dylib" "$output/sanitized.dylib" > "$output/bounds-sanitized.log" 2>&1
"$cc" -O1 -g -fsanitize=address,undefined -fno-sanitize-recover=all \
  -fno-omit-frame-pointer -I"$include" \
  "$here/../tools/test_libressl_chacha.c" -o "$output/test_differential_sanitized"
"$output/test_differential_sanitized" "$output/scalar.dylib" "$output/sanitized.dylib" > "$output/differential-sanitized.log" 2>&1
"$cc" -O1 -g -fsanitize=address,undefined -fno-sanitize-recover=all \
  -fno-omit-frame-pointer -I"$include" \
  "$output/chachatest.c" "$output/sanitized.dylib" -o "$output/regress-sanitized"
"$output/regress-sanitized" > "$output/regress-sanitized.log" 2>&1
printf 'PASS public ChaCha/HChaCha/XChaCha and bulk regress: ASan/UBSan\n' >> "$output/regress-sanitized.log"

# Confirm that a UBSan diagnostic fails the process instead of recovering.
cat > "$output/ubsan-control.c" <<'C'
#include <limits.h>
int main(int argc, char **argv) {
    volatile int value = INT_MAX;
    (void)argv;
    value += argc;
    return value == 0;
}
C
"$cc" -O1 -fsanitize=undefined -fno-sanitize-recover=all \
  "$output/ubsan-control.c" -o "$output/ubsan-control"
if "$output/ubsan-control" > "$output/ubsan-control.log" 2>&1; then
  echo "UBSan negative control unexpectedly succeeded" >&2
  exit 1
fi

for target in aarch64-unknown-openbsd aarch64-unknown-linux-gnu \
  aarch64_be-unknown-linux-gnu x86_64-unknown-openbsd armv7-unknown-linux-gnueabihf; do
  "$cc" -O2 -ffreestanding -target "$target" '-DLCRYPTO_ALIAS(x)=' -I"$include" \
    -c "$output/candidate/chacha.c" -o "$output/cross/$target.o"
  "$cc" -ffreestanding -target "$target" '-DLCRYPTO_ALIAS(x)=' -I"$include" \
    -dM -E "$output/candidate/chacha.c" > "$output/cross/$target.macros"
done
"$cc" -O2 -ffreestanding -target aarch64-unknown-openbsd -mgeneral-regs-only \
  '-DLCRYPTO_ALIAS(x)=' -I"$include" -c "$output/candidate/chacha.c" -o "$output/cross/no-neon.o"
"$cc" -O2 -ffreestanding -target aarch64-unknown-openbsd -DOPENSSL_NO_ASM \
  '-DLCRYPTO_ALIAS(x)=' -I"$include" -c "$output/candidate/chacha.c" -o "$output/cross/no-asm.o"
"$cc" -mgeneral-regs-only '-DLCRYPTO_ALIAS(x)=' -I"$include" -dM -E \
  "$output/candidate/chacha.c" > "$output/cross/no-neon.macros"
"$cc" -DOPENSSL_NO_ASM '-DLCRYPTO_ALIAS(x)=' -I"$include" -dM -E \
  "$output/candidate/chacha.c" > "$output/cross/no-asm.macros"
"$cc" -O2 -fstack-protector-strong '-DLCRYPTO_ALIAS(x)=' -I"$include" -S \
  "$output/candidate/chacha.c" -o "$output/candidate.s"
"$cc" -O2 -ffreestanding -target aarch64-unknown-openbsd '-DLCRYPTO_ALIAS(x)=' \
  -I"$include" -S "$output/candidate/chacha.c" -o "$output/cross/openbsd-aarch64.s"

python3 - "$output" <<'PY'
import hashlib,json,pathlib,sys
p=pathlib.Path(sys.argv[1])
assert 'runtime error: signed integer overflow' in (p/'ubsan-control.log').read_text()
selection={}
for path in sorted((p/'cross').glob('*.macros')):
    actual='#define CHACHA_USE_NEON' in path.read_text()
    expected=path.stem in ('aarch64-unknown-openbsd','aarch64-unknown-linux-gnu')
    assert actual==expected,(path,actual,expected)
    selection[path.stem]='NEON' if actual else 'scalar'
files={str(f.relative_to(p)):hashlib.sha256(f.read_bytes()).hexdigest()
       for f in sorted(p.rglob('*')) if f.is_file() and
       (f.suffix in ('.log','.s','.macros','.c') or f.name in ('compiler.txt','base.txt','commit.txt'))}
summary=dict(status='passed',base=(p/'base.txt').read_text().strip(),
             commit=(p/'commit.txt').read_text().strip(),
             selection=selection,native_openbsd_execution=False,
             sanitizer_failures_fatal=True,ubsan_negative_control='failed as expected',
             note='Cross compilation is not native target execution. Mac public headers are used for standalone translation-unit checks.',
             files=files)
(p/'validation.json').write_text(json.dumps(summary,indent=2)+'\n')
print(json.dumps({k:v for k,v in summary.items() if k!='files'},indent=2))
PY
