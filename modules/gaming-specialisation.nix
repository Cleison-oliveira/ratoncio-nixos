{ config, lib, pkgs, unstable, inputs, ... }:

let
  homeManager = inputs.home-manager.nixosModules.home-manager;
in
{
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
          ./programs
          ./services
          ./system
          ../users/steam
          ./themes
          homeManager
        ];

        home-manager = {
          useGlobalPkgs = true;
          useUserPackages = true;

          users.steam = import ./home-manager/steam {
            inherit pkgs unstable;
            config = { };
          };
        };

        system = {
          stateVersion = "25.05";
        };

        networking = {
          hostName = "gaming";
        };
      };
    };
  };
}
