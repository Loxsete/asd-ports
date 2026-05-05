#!/usr/bin/env bash
set -e

BUILD="/tmp/asd/build/$PKG_NAME"

mkdir -p "$BUILD"
cd "$BUILD"

curl -L "https://github.com/openssl/openssl/releases/download/openssl-${PKG_VERSION}/openssl-${PKG_VERSION}.tar.gz" -o src.tar.gz
tar -xf src.tar.gz --strip-components=1

./Configure \
  --prefix="$ASD_PREFIX" \
  --openssldir=/etc/ssl \
  shared zlib

make -j"$ASD_JOBS"
make install
ldconfig
