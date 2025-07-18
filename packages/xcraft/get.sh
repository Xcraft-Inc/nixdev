#!/bin/bash

if [ -d "$pkg_cache" ]; then
  cp -r "$pkg_cache" "$pkg_dst"
else
  location=

  origin=$(git remote get-url origin)
  protocol=${origin%:*}

  if [ -z "$pkg_host" ]; then
    echo "Choose a Git host for Xcraft (default: github.com)"
    echo "For Epsitec SA, provide git.epsitec.ch"
    read -r pkg_host
    if [ -z "$pkg_host" ]; then
      pkg_host="github.com"
      pkg_path="Xcraft-Inc/xcraft.git"
    fi
  fi

  if [ -z "$pkg_path" ]; then
    echo "Choose a Git path for Xcraft (default: Xcraft-Inc/xcraft.git)"
    echo "For Epsitec SA, provide xcraft/xcraft.git"
    read -r pkg_path
    if [ -z "$pkg_path" ]; then
      pkg_path="Xcraft-Inc/xcraft.git"
    fi
  fi

  pkg_src="$pkg_host/$pkg_path"

  if [ "$protocol" = https ] || [ "$protocol" = http ]; then
    echo "Enter your $pkg_host login:"
    read -r login
    location="https://$login@$pkg_src"
  else
    location="git@$pkg_host:$pkg_path"
  fi

  tries=3

  while [ "$tries" -gt 0 ]; do
    if git clone --recursive "$location" "$pkg_dst"; then
      break
    fi

    tries=$((tries - 1))
  done
fi
