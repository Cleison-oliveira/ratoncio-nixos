{ pkgs, unstable, inputs, ... }: {

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

        networking = {
          hostName = "gaming";
        };

        home-manager = {
          useGlobalPkgs = true;
          useUserPackages = true;
          backupFileExtension = "backup";

          users = {
            steam = import ./home/steam.nix {
              inherit inputs pkgs unstable;
              config = { };
            };
          };
        };
      };
    };
  };
}
