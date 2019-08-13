#!/bin/bash

[ ! -d "$pkg_dst" ] && return 0

cd "$pkg_dst" || exit 1
make uninstall
cd - || exit 1
