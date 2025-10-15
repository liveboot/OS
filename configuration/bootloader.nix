{ lib, ... }:
{
  boot.loader.grub.memtest86.enable = true;

  # isoImage.grubTheme = ./assets/grub-theme;
  # isoImage.efiSplashImage = ./assets/forest-dawn-grub-theme/background.jpg;
  isoImage.appendToMenuLabel = "";
}
