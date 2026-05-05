#!/usr/bin/env bash
set -e

BUILD="/tmp/asd/build/$PKG_NAME"

mkdir -p "$BUILD/src" "$BUILD/build"

curl -L "https://github.com/json-c/json-c/archive/refs/tags/json-c-${PKG_VERSION}.tar.gz" -o "$BUILD/src.tar.gz"
tar -xf "$BUILD/src.tar.gz" -C "$BUILD/src" --strip-components=1

cmake -S "$BUILD/src" -B "$BUILD/build" \
  -DCMAKE_INSTALL_PREFIX="$ASD_PREFIX" \
  -DCMAKE_BUILD_TYPE=Release

cmake --build "$BUILD/build" -j"$ASD_JOBS"
cmake --install "$BUILD/build"
