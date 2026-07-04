#!/usr/bin/env bash
set -e

BUILD="/tmp/asd/build/$PKG_NAME"

mkdir -p "$BUILD"
cd "$BUILD"

curl -L "https://curl.se{PKG_VERSION}.tar.gz" -o src.tar.gz
tar -xf src.tar.gz --strip-components=1

./configure \
  --prefix="$ASD_PREFIX" \
  --with-openssl \
  --with-zlib \
  --enable-ipv6 \
  --disable-static

make -j"$ASD_JOBS"
make install
