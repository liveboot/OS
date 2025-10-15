{ pkgs, lib, ... }:
{
  users.users = {
    # disable default nixos user
    nixos = {
      enable = false;
    };

    live = {
      isNormalUser = true;
      extraGroups = [
        "wheel"
        "networkmanager"
        "video"
      ];
      initialPassword = "boot";
    };
  };

  services.getty.autologinUser = lib.mkForce "live";
}
