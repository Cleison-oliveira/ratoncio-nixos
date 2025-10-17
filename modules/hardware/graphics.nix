{ pkgs, ... }:
 with pkgs; {
  hardware = {
    enableAllFirmware = true;
    graphics = {
      enable = true;
      enable32Bit = true;
      extraPackages = [
        mesa
      ];
    };
  };
 }