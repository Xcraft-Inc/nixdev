#!/bin/bash

git clone "$pkg_src" "$pkg_dst"

cd "$pkg_dst"
git checkout tags/$pkg_ver
cd -
