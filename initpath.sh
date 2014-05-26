#!/bin/sh

. ./pkg/config

function pathadd()
{
  if [ -d "$1" ] && [[ ":$PATH:" != *":$1:"* ]]; then
    PATH="${PATH:+"$PATH:"}$1"
  fi
}

pathadd "$boot_sysroot/bin"
