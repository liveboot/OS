#! /bin/sh

export NIXOS_LABEL="Liveboot.org"
export NIXOS_LABEL_VERSION=""

REALPATH=$(realpath ./result/iso/liveboot.iso)
nix --extra-experimental-features 'nix-command flakes' build -j auto
NEWPATH=$(realpath ./result/iso/liveboot.iso)

# can happen when reverting changes after cleaning, small workaround
if ! [ -f $NEWPATH ]
then
    nix --extra-experimental-features 'nix-command flakes' build -j auto --repair
    NEWPATH=$(realpath ./result/iso/liveboot.iso)
fi

# save some space
if [ -f $REALPATH ] && [ $REALPATH != $NEWPATH ]
then
    SIZE=$(du -m $REALPATH | cut -f1)
    rm -rf $(dirname $(dirname $REALPATH))
    echo removed old iso, saved $SIZE MB
fi
