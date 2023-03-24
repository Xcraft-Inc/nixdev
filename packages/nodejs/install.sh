#!/bin/bash

cd "$pkg_dst" || exit 1
make install
cd - || exit 1

"$boot_sysroot/usr/bin/node" "$boot_sysroot/usr/bin/npm" install --prefix="$boot_sysroot/usr/lib" npm@8.19.4
