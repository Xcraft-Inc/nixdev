#!/bin/bash

. ./pkg/pkg.sh

[ "$1" = quiet ] && quiet=quiet || quiet=

function boot_normal()
{
  echo "[stage0] begin of stage0"

  if [ "$(uname -m)" = arm64 ]; then
    export   CFLAGS="-O2 -g0 -mtune=native"
    export CXXFLAGS="-O2 -g0 -mtune=native"
  else
    export   CFLAGS="-O2 -g0 -mtune=native -march=native"
    export CXXFLAGS="-O2 -g0 -mtune=native -march=native"
  fi

  pkg_uninstall nodejs
  pkg_remove sysroot
  pkg_install sysroot

  pkg_get nodejs
  pkg_build nodejs
  pkg_install nodejs

  pkg_get xcraft

  unset CFLAGS CXXFLAGS

  echo "[stage0] end of stage0"

  . ./initpath.sh $quiet
  node "$boot_sysroot/xcraft/lib/xcraft/stage1.js" "$boot_sysroot/usr/bin"

  cd "$boot_sysroot/xcraft/" || return
}

function boot_dist()
{
  echo "Building a dist package"
  pkg_cache nodejs
  pkg_cache xcraft
}

echo "Bootstrap..."

if [ $# = 1 ] && [ "$1" = dist ]; then
  boot_dist
else
  boot_normal
fi
