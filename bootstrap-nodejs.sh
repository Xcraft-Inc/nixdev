#!/bin/bash

. ./pkg/pkg.sh

[ "$1" = quiet ] && quiet=quiet || quiet=

echo "[stage0] begin of stage0"

pkg_uninstall nodejs
pkg_remove sysroot
pkg_install sysroot

pkg_get nodejs
pkg_build nodejs
pkg_install nodejs

pkg_get toolchain

echo "[stage0] end of stage0"

. ./initpath.sh $quiet
node "$boot_sysroot/toolchain/scripts/stage1.js"

cd "$boot_sysroot/toolchain/"
