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
  isoImage.splashImage = ../assets/splash.png;
  isoImage.syslinuxTheme = builtins.readFile ../assets/syslinux-theme.txt;

  isoImage.efiSplashImage = ../assets/splash.png;
  isoImage.appendToMenuLabel = "";
}
