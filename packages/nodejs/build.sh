#!/bin/bash

cd "$boot_build/nodejs/" || exit 1

args=""
# Use system zlib with macOS Monterey
if [[ $(uname -r) =~ ^21\. ]] && [[ $(uname -s) = Darwin ]]; then
  args="--shared-zlib"
fi

./configure --prefix="$boot_sysroot/usr" $args
make -j"$boot_nproc"
cd - || exit 1
