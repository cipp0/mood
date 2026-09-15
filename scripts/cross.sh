#!/bin/bash
# cross builds of the externals (squinewave~, moogladder2~, reverbsc2~)
# with zig: Pd for Linux (x86_64, arm64) and Windows (x64), Max for Windows (x64).
# usage: scripts/cross.sh [pd-linux] [pd-windows] [max-windows]
set -e
cd "$(dirname "$0")/.."
PD_SRC=${PD_SRC:-/Applications/Pd-0.56-2.app/Contents/Resources/src}
MAX_SDK=${MAX_SDK:-max-sdk-base/c74support}
CFLAGS="-O3 -Wall -Wno-unused-function -Icore"
targets=${*:-pd-linux pd-windows max-windows}

# name, wrapper, core, defines
objects() {
    echo "squinewave squinewave~.c core/squinewave.c"
    echo "moogladder2 vafilter~.c core/vafilters.c -DVA_NAME=\"moogladder2\""
    echo "reverbsc2 reverbsc~.c core/reverbsc.c -DREVERBSC2"
}

for t in $targets; do
case $t in
pd-linux)
    for arch in x86_64 aarch64; do
        out=build/linux-$arch/pd; mkdir -p $out
        objects | while read name wrap core defs; do
            zig cc -target $arch-linux-gnu.2.17 $CFLAGS -s -fPIC -shared -Ipd -I"$PD_SRC" \
                ${defs:+"$defs"} -DVA_SETUP=${name}_tilde_setup -o "$out/$name~.pd_linux" pd/$wrap $core -lm
        done
    done ;;
pd-windows)
    out=build/windows-x64/pd; mkdir -p $out build/tmp
    # pd.dll import library from the Pd symbols the externals use
    printf 'LIBRARY pd.dll\nEXPORTS\n' > build/tmp/pd.def
    [ -e build/linux-x86_64/pd/squinewave~.pd_linux ] || "$0" pd-linux
    nm -D -u build/linux-x86_64/pd/*.pd_linux | awk 'NF == 2 {print $NF}' | grep -v @ | sort -u \
        | sed -E 's/^(s_[a-z]+)$/\1 DATA/' >> build/tmp/pd.def
    zig dlltool -d build/tmp/pd.def -l build/tmp/libpd.a -m i386:x86-64
    objects | while read name wrap core defs; do
        zig cc -target x86_64-windows-gnu $CFLAGS -s -shared -Ipd -I"$PD_SRC" \
            ${defs:+"$defs"} -DVA_SETUP=${name}_tilde_setup -o "$out/$name~.dll" pd/$wrap $core \
            build/tmp/libpd.a -Wl,--export-all-symbols
    done
    rm -f $out/*.lib $out/*.pdb ;;
max-windows)
    out=build/windows-x64/max; mkdir -p $out
    objects | while read name wrap core defs; do
        zig cc -target x86_64-windows-gnu $CFLAGS -s -shared -Imax -I$MAX_SDK/max-includes -I$MAX_SDK/msp-includes \
            -DWIN_VERSION -D_USE_MATH_DEFINES -DMAXAPI_USE_MSCRT -Wno-ignored-attributes -Wno-pragma-pack \
            ${defs:+"$defs"} -o "$out/$name~.mxe64" max/$wrap $core $MAX_SDK/max-includes/common/commonsyms.c \
            $MAX_SDK/max-includes/x64/MaxAPI.lib $MAX_SDK/msp-includes/x64/MaxAudio.lib
    done
    rm -f $out/*.lib $out/*.pdb ;;
esac
done
