#!/bin/bash

export CFLAGS="-O2 -g0 -mtune=native" CXXFLAGS="-O2 -g0 -mtune=native"

cd "$boot_build/nodejs/"
./configure --prefix="$boot_sysroot/usr"
make -j$boot_nproc
cd -

unset CFLAGS CXXFLAGS
