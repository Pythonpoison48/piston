#!/usr/bin/env bash

# Prebuilt ponyc release (includes runtime libraries)
curl -L "https://github.com/ponylang/ponyc/releases/download/0.77.0/ponyc-x86-64-unknown-linux-ubuntu24.04.tar.gz" -o ponyc.tar.gz

tar xzf ponyc.tar.gz --strip-components=1
rm ponyc.tar.gz
