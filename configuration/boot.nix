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
  isoImage.syslinuxTheme = ''
        MENU TITLE Liveboot
        MENU RESOLUTION 1920 1080
        MENU CLEAR
        MENU ROWS 6
        MENU CMDLINEROW -4
        MENU TIMEOUTROW -3
        MENU TABMSGROW  -2
        MENU HELPMSGROW -1
        MENU HELPMSGENDROW -1
        MENU MARGIN 0

        #                                FG:AARRGGBB  BG:AARRGGBB   shadow
        MENU COLOR title        1;36;44 #9033ccff #a0000000 std
        MENU COLOR sel          7;37;40 #e0ffffff #20ffffff all
        MENU COLOR unsel        37;44   #50ffffff #a0000000 std
        MENU COLOR help         37;40   #c0ffffff #a0000000 std
        MENU COLOR timeout_msg  37;40   #80ffffff #00000000 std
        MENU COLOR timeout      1;37;40 #c0ffffff #00000000 std
        MENU COLOR msg07        37;40   #90ffffff #a0000000 std
        MENU COLOR tabmsg       31;40   #30ffffff #00000000 std
  '';

  isoImage.efiSplashImage = ../assets/splash.png;
  isoImage.appendToMenuLabel = "";
}
