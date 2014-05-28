#!/bin/bash

echo "Enter your git.epsitec.ch username:"
read username

git config --global http.sslVerify false

git clone "https://$username@$pkg_src" "$pkg_dst"
