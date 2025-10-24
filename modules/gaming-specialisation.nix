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
          ./themes
        ];

        system.stateVersion = "25.05";
        networking.hostName = "gaming";
      };
    };
  };
}
