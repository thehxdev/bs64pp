#!/bin/sh

set -xe

CC='c++'
CFLAGS='-std=gnu++11 -W -Wall -Wextra -Og -ggdb'
BIN='base64-test'
SRC_FILES='base64.cpp main.cpp'

if ! command -v "$CC" >/dev/null 2>&1; then
    echo -e '[ERROR] Could not find a c++ compiler (c++)'
    exit 1
fi

$CC $CFLAGS -o base64-test $SRC_FILES
