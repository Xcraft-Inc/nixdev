#!/bin/bash

. ./pkg/pkg.sh

echo "[stage0] begin of stage0"

pkg_uninstall nodejs
pkg_remove sysroot
pkg_install sysroot

pkg_get nodejs
pkg_build nodejs
pkg_install nodejs

pkg_get toolchain

echo "[stage0] end of stage0"

. ./initpath.sh
node $boot_sysroot/toolchain/scripts/stage1.js

cd "$boot_sysroot/toolchain/"
