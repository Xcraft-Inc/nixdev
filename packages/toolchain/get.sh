#!/bin/bash

git config --global http.sslVerify false

location=

if [ "$USER" != "gitlab_ci_runner" ]; then
  echo "Enter your git.epsitec.ch username:"
  read username
  location=$username
else
  location=gitlab-ci-token:$pkg_ci_token
fi

git clone "https://$username@$pkg_src" "$pkg_dst"