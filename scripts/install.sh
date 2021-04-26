#!/usr/bin/env bash

DIST="./dist"
mkdir -p "$DIST"

export PKGDEST="$DIST/pkg"
export SRCDEST="$DIST/src"

makepkg -cfi

