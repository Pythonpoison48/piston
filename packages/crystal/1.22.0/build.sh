#!/bin/bash

PREFIX=$(realpath $(dirname $0))

curl -L "https://github.com/crystal-lang/crystal/releases/download/1.22.0/crystal-1.22.0-1-linux-x86_64.tar.gz" -o crystal.tar.gz
tar xzf crystal.tar.gz --strip-components=1
rm crystal.tar.gz
