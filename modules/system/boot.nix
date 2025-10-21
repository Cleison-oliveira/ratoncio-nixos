{ config, pkgs, ... }: {
  boot.kernelParams = [
    "pcie_aspm=off"
    "quiet"
    "udev.log_level=3"
    "video=efifb:1920x1080"
  ];
  boot.loader.systemd-boot.enable = true;
  boot.loader.timeout = 0;
  boot.loader.efi.canTouchEfiVariables = true;
}
