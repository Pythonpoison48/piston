#!/usr/bin/env bash

curl -L "https://sourceforge.net/projects/fbc/files/FreeBASIC-1.10.1/Binaries-Linux/FreeBASIC-1.10.1-linux-x86_64.tar.gz/download" -o freebasic.tar.gz
tar xf freebasic.tar.gz --strip-components=1
rm freebasic.tar.gz

# fbc is linked against libtinfo5; vendor it so the package also works on
# distributions that only ship libtinfo6 (Debian trixie and newer).
curl -L "https://archive.debian.org/debian/pool/main/n/ncurses/libtinfo5_6.2+20201114-2+deb11u2_amd64.deb" -o libtinfo5.deb
dpkg-deb -x libtinfo5.deb libtinfo5
cp -a libtinfo5/lib/x86_64-linux-gnu/libtinfo.so.5* lib/
rm -rf libtinfo5 libtinfo5.deb