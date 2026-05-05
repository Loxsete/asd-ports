#!/usr/bin/env bash
set -e

BUILD="/tmp/asd/build/$PKG_NAME"

mkdir -p "$BUILD"
cd "$BUILD"

curl -L "https://www.python.org/ftp/python/${PKG_VERSION}/Python-${PKG_VERSION}.tar.xz" -o src.tar.xz
tar -xJf src.tar.xz --strip-components=1

./configure \
  --prefix="$ASD_PREFIX" \
  --enable-optimizations \
  --with-ensurepip=install \
  --enable-shared \
  LDFLAGS="-Wl,-rpath $ASD_PREFIX/lib"

make -j"$ASD_JOBS"
make install
ldconfig
