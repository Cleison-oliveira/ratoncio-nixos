{ config, pkgs, ... }: with pkgs; {
  boot = {
    kernelParams = [
      "pcie_aspm=off"
      "quiet"
      "udev.log_level=3"
      "video=efifb:1920x1080"
    ];

    consoleLogLevel = 3;

    kernelPackages = linuxPackages_latest;

    loader = {
      systemd-boot.enable = true;
      timeout = 0;
      efi.canTouchEfiVariables = true;
    };
  };
}
