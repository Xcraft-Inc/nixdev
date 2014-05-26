#!/bin/sh

function pkg_uninstall()
{
  local package=$1

  echo "[stage0:$package] uninstall"
}

function pkg_install()
{
  local package=$1

  echo "[stage0:$package] install"
}

function pkg_remove()
{
  local package=$1

  echo "[stage0:$package] remove"
}

function pkg_get()
{
  local package=$1

  echo "[stage0:$package] get"
}

function pkg_build()
{
  local package=$1

  echo "[stage0:$package] build"
}
