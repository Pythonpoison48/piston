#!/usr/bin/env bash

curl -L "https://github.com/llvm/llvm-project/releases/download/llvmorg-23.1.3/LLVM-23.1.3-Linux-X64.tar.xz" -o llvm-ir.tar.xz

# Only keep the tools needed by the package (the full bin directory is ~9 GB).
tar xf llvm-ir.tar.xz \
    LLVM-23.1.3-Linux-X64/bin/clang \
    LLVM-23.1.3-Linux-X64/bin/clang-23 \
    LLVM-23.1.3-Linux-X64/bin/llc \
    --strip-components=1

rm llvm-ir.tar.xz
