#!/usr/bin/env bash

# Cloning vlang source
git clone https://github.com/vlang/v
cd v

# 0.5.2 release plus the self-hosting fix from master
git checkout 4413ab4aaa85db49a647aa093834cd107e2689d2

# Building and installing vlang. `make` may fail at the final self-test
# because the source checkout does not include the bundled GC archive, but the
# compiler itself is already built at that point.
make || true
test -x v