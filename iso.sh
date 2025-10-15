#! /bin/sh

export NIXOS_LABEL="Liveboot.org"
export NIXOS_LABEL_VERSION=""

nix build -j auto
