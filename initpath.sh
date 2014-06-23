#!/bin/bash

. ./pkg/config

function pathadd()
{
  if [ -d "$1" ] && [[ ":$PATH:" != *":$1:"* ]]; then
    PATH="$1:$PATH"
  fi
}

# Try to add our node in the user's bin directory.
echo "It is recommended to add a node symlink to your ~/bin directory; do you agree? [yN]"
read input

if [ "$input" != y ]; then
  pathadd "$boot_sysroot/bin"
  exit 0
fi

if [ ! -d "$HOME/bin" ]; then
  mkdir "$HOME/bin"
else
  if [ -f "$HOME/bin/node" ]; then
    echo "A node binary already exists in your ~/bin directory; overwrite? [yN]"
    read input
    [ "$input" != y ] && exit 0
    rm -f "$HOME/bin/node"
  fi
fi

ln -s "$(pwd)/sysroot/bin/node" "$HOME/bin/node"
