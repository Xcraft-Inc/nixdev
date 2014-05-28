#!/bin/bash

[ ! -d "$pkg_dst" ] && return 0

cd "$pkg_dst"
make uninstall
cd -
