#!/bin/bash

set -eu -o pipefail

git clone --depth 1 --recursive https://github.com/znc/znc.git
cd znc
./autogen.sh || true
./configure --enable-perl --enable-tcl --enable-python
make
make install
