{ pkgs, config, ... }:
{
  imports = [
    ./isoImage.nix
    ./bootloader.nix
    ./users.nix
  ];

  system.stateVersion = "25.11";
  system.nixos.label = config.system.nixos.release;
  system.nixos.distroName = "Liveboot.org";

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
