{ config, lib, pkgs, ... }: {
  imports = [
    ./hardware
  ];

  specialisation = {
    steamos = {
      inheritParentConfig = false;
      configuration = {
        imports = [
          ./gaming
          ./hardware
          ./services
          ./system
          ../users/steam
        ];

        system.stateVersion = "25.05";
        networking.hostName = "gaming";
        boot.kernelPackages = pkgs.linuxPackages_latest;
        programs.git.enable = true;
      };
    };
  };
}
