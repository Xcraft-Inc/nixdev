#!/bin/sh

cd "$boot_build/nodejs/"
./configure --prefix="$boot_sysroot"
make -j$boot_nproc
cd -
