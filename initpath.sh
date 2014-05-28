#!/bin/bash

. ./pkg/config

function pathadd()
{
  if [ -d "$1" ] && [[ ":$PATH:" != *":$1:"* ]]; then
    PATH="$1:$PATH"
  fi
}

pathadd "$boot_sysroot/bin"
