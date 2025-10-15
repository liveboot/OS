<div align="center">
    <a href="https://liveboot.org">
        <img src="assets/liveboot.svg" alt="Liveboot Logo" width="120" />
    </a>
    <h1>
        <a href="https://liveboot.org">Liveboot.org</a>
    </h1>
    <p>
        <strong>Modern rescue OS - ISO built with Nix</strong>
    </p>
    <a href="https://nixos.org">
        <img src="https://img.shields.io/badge/NixOS-5277C3?style=for-the-badge&logo=nixos&logoColor=white" alt="NixOS Badge"/>
    </a>
    <a href="https://github.com/liveboot">
        <img src="https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white" alt="GitHub Badge"/>
    </a>
</div>

## 🛠️ Building

### Requirements

- [Nix](https://nix.dev/)

**optional:**

- QEMU - for VM
- OVMF - for VM with UEFI support
- nixfmt - for linting and formatting

> [!IMPORTANT]
> Depending on your local Nix installation, you may have to run some of the following commands with elevated privileges.

### ISO

```
./iso.sh
```

Building can take quite a while.
Subsequent builds using the same packages are cached.

If you are regularly building Liveboot.org, you may notice your disk usage steadily going up.
This happens because of old packages still residing in the Nix store. See [section below](#updating-packages).

### VM

```
./vm.sh [uefi]
```

Running the VM-script will attempt to build the ISO first, ensuring it's up-to-date.

By default, the VM will boot in legacy (BIOS) mode. You can optionally run it in UEFI mode. For the latter, sometimes the OVMF can't be found automatically. In that case, specify `OVMF` as an environment variable, containing the path pointing to `OVMF.fd`:

```
OVMF="/path/to/OVMF.fd" ./vm.sh uefi
```

## 💻 Developing

### Linting/Formatting

We provide some helper scripts for typical housekeeping:

```
./lint.sh
./format.sh
```

### Updating packages

This will bump the `flake.lock` file:

```
nix flake update
```

As usually lots of Nix store entries are invalidated, it's a good idea to clean up your local store afterwards:

```
nix-store --gc
```
