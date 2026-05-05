#!/usr/bin/env bash
set -e

BUILD="/tmp/asd/build/$PKG_NAME"

mkdir -p "$BUILD"
cd "$BUILD"

curl -L "https://github.com/libffi/libffi/releases/download/v${PKG_VERSION}/libffi-${PKG_VERSION}.tar.gz" -o src.tar.gz
tar -xf src.tar.gz --strip-components=1

./configure --prefix="$ASD_PREFIX"
make -j"$ASD_JOBS"
make install
