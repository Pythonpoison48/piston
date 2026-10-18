#!/usr/bin/env bash

# Install location
PREFIX=$(realpath $(dirname $0))

# Official binary distribution (much faster than rebuilding from source)
curl -L "https://julialang-s3.julialang.org/bin/linux/x64/1.13/julia-1.13.2-linux-x86_64.tar.gz" -o julia.tar.gz

tar xzf julia.tar.gz --strip-components=1 -C "$PREFIX"

rm julia.tar.gz
