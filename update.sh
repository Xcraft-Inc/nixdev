#!/bin/bash

. ./pkg/pkg.sh

function update()
{
  echo "[update] begin"

  export CFLAGS="-O2 -g0 -mtune=native -march=native" CXXFLAGS="-O2 -g0 -mtune=native -march=native"

  pkg_uninstall nodejs
  pkg_remove nodejs

  pkg_get nodejs
  pkg_build nodejs
  pkg_install nodejs

  unset CFLAGS CXXFLAGS

  echo "[update] end"
}

update
