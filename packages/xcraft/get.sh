#!/bin/bash

if [ -d "$pkg_cache" ]; then
  cp -r "$pkg_cache" "$pkg_dst"
else
  git config --global http.sslVerify false

  location=

  origin=$(git remote get-url --all origin)
  protocol=${origin%:*}

  if [ "$protocol" = https ] || [ "$protocol" = http ]; then
    echo "Enter your git.epsitec.ch username:"
    read -r username
    location="https://$username@$pkg_src"
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
