#!/bin/bash

if [ -d "$pkg_cache" ]; then
  cp -r "$pkg_cache" "$pkg_dst"
else
  git config --global http.sslVerify false

  location=

  if [ "$USER" != "gitlab_ci_runner" ]; then
    echo "Enter your git.epsitec.ch username:"
    read -r username
    location=$username
  else
    location=gitlab-ci-token:$pkg_ci_token
  fi

  tries=3

  while [ "$tries" -gt 0 ]; do
    if git clone --recursive "https://$location@$pkg_src" "$pkg_dst"; then
      break
    fi

    tries=$((tries - 1))
  done
fi
