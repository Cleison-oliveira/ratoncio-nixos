{ pkgs, unstable, inputs, ... }: with pkgs; {

  imports = [
    ../common/hardware
  ];

  specialisation = {
    steamos = {
      inheritParentConfig = false;
      configuration = {
        imports = [
          ../common
          ./programs
          ./users
          inputs.home-manager.nixosModules.home-manager
        ];

        boot.kernelPackages = linuxPackages_zen;

        networking = {
          hostName = "gaming";
        };

        home-manager = {
          useGlobalPkgs = true;
          useUserPackages = true;
          backupFileExtension = "backup";

          users = {
            steam = import ../../home/steam {
              inherit inputs pkgs unstable;
              config = { };
            };
          };
        };
      };
    };
  };
}
