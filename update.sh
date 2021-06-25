#!/bin/bash

. ./pkg/pkg.sh

function update()
{
  echo "[update] begin"

  if [ "$(uname -m)" = arm64 ]; then
    export   CFLAGS="-O2 -g0 -mtune=native"
    export CXXFLAGS="-O2 -g0 -mtune=native"
  else
    export   CFLAGS="-O2 -g0 -mtune=native -march=native"
    export CXXFLAGS="-O2 -g0 -mtune=native -march=native"
  fi

  pkg_uninstall nodejs
  pkg_remove nodejs

  pkg_get nodejs
  pkg_build nodejs
  pkg_install nodejs

  unset CFLAGS CXXFLAGS

  echo "[update] end"
}

update
