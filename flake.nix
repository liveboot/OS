{
  description = "Liveboot.org ISO";
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

  outputs =
    { self, nixpkgs, ... }:
    let
      archs = [
        "x86_64-linux"
        "aarch64-linux"
      ];
      modules = [
        "${nixpkgs}/nixos/modules/installer/cd-dvd/installation-cd-minimal-combined.nix"
        ./configuration
      ];
      mkConfig =
        system:
        nixpkgs.lib.nixosSystem {
          inherit system modules;
        };
    in
    {
      nixosConfigurations = builtins.listToAttrs (
        map (system: {
          name = "liveboot_${system}";
          value = mkConfig system;
        }) archs
      );

      packages = builtins.listToAttrs (
        map (system: {
          name = system;
          value = {
            default = (mkConfig system).config.system.build.isoImage;
          };
        }) archs
      );
    };
}
