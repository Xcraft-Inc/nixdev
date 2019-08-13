#!/bin/bash

. ./pkg/config

function pkg_uninstall()
{
  local package=$1

  . "./packages/$package/config"

  echo "[stage0:$package] uninstall"
  . "./packages/$package/uninstall.sh"
}

function pkg_install()
{
  local package=$1

  . "./packages/$package/config"

  echo "[stage0:$package] install"
  . "./packages/$package/install.sh"
}

function pkg_remove()
{
  local package=$1

  . "./packages/$package/config"

  echo "[stage0:$package] remove"
  . "./packages/$package/remove.sh"
}

function pkg_get()
{
  local package=$1

  . "./packages/$package/config"

  echo "[stage0:$package] get"
  . "./packages/$package/get.sh"
}

function pkg_build()
{
  local package=$1

  . "./packages/$package/config"

  echo "[stage0:$package] build"
  . "./packages/$package/build.sh"
}

function pkg_cache()
{
  local package=$1

  . "packages/$package/config"

  echo "[stage0:$package] cache"

  if [ ! -d "$boot_cache" ]; then
    mkdir "$boot_cache"
  fi

  if [ ! -d "$boot_build" ]; then
    mkdir "$boot_build"
  fi

  pkg_get "$package"

  . "./packages/$package/cache.sh"

  rm -r "$boot_build"
}

