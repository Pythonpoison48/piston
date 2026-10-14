#!/usr/bin/env bash

# Put instructions to build your package in here
curl -R -O -L http://www.lua.org/ftp/lua-5.5.1.tar.gz
tar zxf lua-5.5.1.tar.gz
rm lua-5.5.1.tar.gz

cd lua-5.5.1
# Building Lua
make linux
# To check that Lua has been built correctly
make test
# Installing Lua
make linux install
