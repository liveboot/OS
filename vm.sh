#!/usr/bin/env bash
set -e

./iso.sh

ISO="result/iso/liveboot.iso"
CORES=$(expr $(nproc) / 2)
QEMU_OPTS=(-boot d -cdrom "$ISO" -m 4G -cpu host -smp cores=$CORES -name Liveboot -enable-kvm)

if [ -z $OVMF ]; then
    # default path on Arch
    OVMF="/usr/share/ovmf/x64/OVMF.4m.fd"
fi

if [[ $1 == "uefi" ]]; then
    # NixOS has a nice wrapper, use that if possible
    if command -v qemu-uefi &>/dev/null; then
        qemu-uefi "${QEMU_OPTS[@]}"
    else
        qemu-system-x86_64 -bios "$OVMF" "${QEMU_OPTS[@]}"
    fi
else
    qemu-system-x86_64 "${QEMU_OPTS[@]}"
fi
