#!/bin/bash

cd "$boot_build/nodejs/" || exit 1
./configure --prefix="$boot_sysroot/usr"
make -j"$boot_nproc"
cd - || exit 1
