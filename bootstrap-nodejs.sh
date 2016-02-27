#!/bin/bash

. ./pkg/pkg.sh

[ "$1" = quiet ] && quiet=quiet || quiet=

function boot_normal()
{
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
  node "$boot_sysroot/toolchain/lib/xcraft/stage1.js" "$boot_sysroot/usr/bin"

  cd "$boot_sysroot/toolchain/"
}

function boot_dist()
{
  echo "Building a dist package"
  pkg_cache nodejs
  pkg_cache toolchain
}

[ "$#" = 1 -a "$1" = dist ] \
  && boot_dist \
  || boot_normal
