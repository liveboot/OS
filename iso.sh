#! /bin/sh

export NIXOS_LABEL="Liveboot.org"
export NIXOS_LABEL_VERSION=""

REALPATH=$(realpath ./result/iso/liveboot.iso)
nix --extra-experimental-features 'nix-command flakes' build -j auto
NEWPATH=$(realpath ./result/iso/liveboot.iso)

# save some space
if [ -f $REALPATH ] && [ $REALPATH != $NEWPATH ]
then
    SIZE=$(du -m $REALPATH | cut -f1)
    rm $REALPATH
    echo removed old iso, saved $SIZE MB
fi
