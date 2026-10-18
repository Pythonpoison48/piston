#!/usr/bin/env bash

# Build octave from source
PREFIX=$(realpath $(dirname $0))

mkdir -p build

cd build

curl -L "https://ftp.gnu.org/gnu/octave/octave-11.3.0.tar.xz" -o octave.tar.xz

tar xf octave.tar.xz --strip-components=1

# === autoconf based ===
# Disable support for GUI, HDF5 and Java
./configure --prefix "$PREFIX" --without-opengl --without-qt --without-x --without-hdf5 --disable-java

make -j$(nproc)
make install -j$(nproc)

cd ../
rm -rf build