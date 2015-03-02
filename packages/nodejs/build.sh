#!/bin/bash

cd "$boot_build/nodejs/"
./configure --prefix="$boot_sysroot/usr"
make -j$boot_nproc
cd -
