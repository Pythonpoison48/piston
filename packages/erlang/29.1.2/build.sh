#!/bin/bash

PREFIX=$(realpath $(dirname $0))

mkdir -p build

cd build

curl -L "https://github.com/erlang/otp/releases/download/OTP-29.1.2/otp_src_29.1.2.tar.gz" -o erlang.tar.gz
tar xzf erlang.tar.gz --strip-components=1
rm erlang.tar.gz

export ERL_TOP=$(pwd)
./configure --prefix "$PREFIX"
make -j$(nproc)
make install -j$(nproc)

cd ..

rm -rf build 

