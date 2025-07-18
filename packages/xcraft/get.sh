#!/bin/bash

if [ -d "$pkg_cache" ]; then
  cp -r "$pkg_cache" "$pkg_dst"
else
  location=

  origin=$(git remote get-url origin)
  protocol=${origin%:*}

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
