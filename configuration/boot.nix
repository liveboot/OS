{ lib, ... }:
{
  boot.loader.grub.memtest86.enable = true;

  boot.kernelParams = [
    "quiet"
    "splash"
    "msr.allow_writes=on"
  ];

  # isoImage.grubTheme = ./assets/grub-theme;
  # isoImage.efiSplashImage = ./assets/forest-dawn-grub-theme/background.jpg;
  isoImage.appendToMenuLabel = "";
}
