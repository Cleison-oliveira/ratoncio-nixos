{ config, ... }:
{
  hardware = {
    enableAllFirmware = true;
    graphics = {
      enable = true;
      enable32Bit = true;
    };

    nvidia = {
      modesetting = {
        enable = true;
      };
      open = true;
      powerManagement = {
        enable = true;
        finegrained = false;
      };

      nvidiaSettings = true;
      package = config.boot.kernelPackages.nvidiaPackages.beta;
    };
  };

  services = {
    xserver = {
      enable = false;
      videoDrivers = [ "nvidia" ];
    };
  };
}
