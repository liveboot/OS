#! /bin/sh

set -e

find . -name '*.nix' | xargs nixfmt -c
echo No issues found!
