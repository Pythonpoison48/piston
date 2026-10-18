#!/bin/bash
PREFIX=$(realpath $(dirname $0))

curl https://www.sqlite.org/2026/sqlite-amalgamation-3540100.zip -o sqlite.zip
unzip -q sqlite.zip
rm -rf sqlite.zip

gcc -DSQLITE_THREADSAFE=0 -DSQLITE_OMIT_LOAD_EXTENSION sqlite-amalgamation-3540100/shell.c sqlite-amalgamation-3540100/sqlite3.c -o sqlite3 -lm

rm -rf sqlite-amalgamation-3540100
