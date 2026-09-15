#!/bin/bash
# zips for a GitHub release in dist/: one per platform, the Max patches with the
# Max externals, the Pd externals with their help patches (Max does not run on Linux)
set -e
cd "$(dirname "$0")/.."
V=${VERSION:-$(git describe --tags --always 2>/dev/null || echo dev)}
rm -rf dist; mkdir -p dist
pack() {  # name, max externals dir (or -), pd externals dir
    d=dist/mood-$V-$1; mkdir -p $d/pd
    cp $3/* pd/*-help.pd $d/pd/
    if [ "$2" != - ]; then
        mkdir -p $d/max
        cp -R $2/* max/*.maxhelp patches/mood.amxd patches/mood.maxpat $d/max/
    fi
    cp README.md LICENSE LICENSE-MAX-SDK.md $d/
    (cd dist && zip -qry mood-$V-$1.zip mood-$V-$1 && rm -rf mood-$V-$1)
}
pack macos build/macos/max build/macos/pd
pack windows-x64 build/windows-x64/max build/windows-x64/pd
pack linux-x86_64 - build/linux-x86_64/pd
pack linux-aarch64 - build/linux-aarch64/pd
cp patches/mood.amxd dist/
ls -l dist
