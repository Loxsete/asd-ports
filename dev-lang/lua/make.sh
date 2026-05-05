#!/usr/bin/env bash
set -e

BUILD="/tmp/asd/build/$PKG_NAME"

mkdir -p "$BUILD"
cd "$BUILD"

curl -L "https://www.lua.org/ftp/lua-${PKG_VERSION}.tar.gz" -o src.tar.gz
tar -xf src.tar.gz --strip-components=1

make -j"$ASD_JOBS" linux
make INSTALL_TOP="$ASD_PREFIX" install
