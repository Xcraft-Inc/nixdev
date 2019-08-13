#!/bin/bash

cd "$pkg_dst" || exit 1
make install
cd - || exit 1
