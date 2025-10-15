#! /bin/sh

find . -name '*.nix' | xargs nixfmt
