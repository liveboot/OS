#! /bin/sh

export NIXOS_LABEL="Liveboot.org"
export NIXOS_LABEL_VERSION=""

nix --extra-experimental-features 'nix-command flakes' build -j auto
