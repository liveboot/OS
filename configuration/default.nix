{ pkgs, config, ... }:
{
  imports = [
    ./isoImage.nix
    ./boot.nix
    ./users.nix
  ];

  system.stateVersion = "25.11";
  system.nixos.label = config.system.nixos.release;
  system.nixos.distroName = "Liveboot";
  system.nixos.vendorId = "liveboot";
  system.nixos.vendorName = "Liveboot";
  system.nixos.variant_id = null;
  # consolidate and write own /etc/os-release, see what is needed

  networking.hostName = "liveboot";

  services.xserver.enable = true;

  hardware.enableAllHardware = true;

  services.displayManager.gdm.enable = true;
  services.desktopManager.gnome.enable = true;
  services.displayManager.autoLogin.user = "live";
  services.displayManager.autoLogin.enable = true;

  environment.systemPackages = with pkgs; [
    cowsay
    btop
  ];
}
