#!/usr/bin/env bash

set -e

curl -L https://ftp.gnu.org/gnu/smalltalk/smalltalk-3.2.5.tar.gz -o smalltalk-3.2.5.tar.gz
tar xzf smalltalk-3.2.5.tar.gz

rm smalltalk-3.2.5.tar.gz

cd smalltalk-3.2.5

CFLAGS="-O2 -Wno-error=incompatible-pointer-types" ./configure --disable-glibtest
rm libc.la

make
make install

chmod +x gst
cd ..
