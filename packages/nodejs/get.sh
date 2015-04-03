#!/bin/bash

if [ -d "$pkg_cache" ]; then
  cp -r "$pkg_cache" "$pkg_dst"
else
  git clone -b $pkg_ver --depth 1 "$pkg_src" "$pkg_dst"
fi
