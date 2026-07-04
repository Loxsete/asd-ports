#!/usr/bin/env bash
set -e

BUILD="/tmp/asd/build/${PKG_NAME}-${PKG_VERSION}"

mkdir -p "$BUILD"
cd "$BUILD"

TAG_VERSION="${PKG_VERSION//./_}"

curl -L \
    "https://github.com/curl/curl/archive/refs/tags/curl-${TAG_VERSION}.tar.gz" \
    -o src.tar.gz

tar -xf src.tar.gz --strip-components=1

./buildconf 2>/dev/null || true

./configure \
    --prefix="$ASD_PREFIX" \
    --with-openssl \
    --with-zlib \
    --enable-ipv6 \
    --disable-static

make -j"$ASD_JOBS"
make install
