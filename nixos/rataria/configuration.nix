{ pkgs, unstable, inputs, ... }: {

  imports = [
    ../common
    ./hardware
    ./users
    ./virtual
    inputs.home-manager.nixosModules.home-manager
  ];



  networking = {
    hostName = "rataria";
  };

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    backupFileExtension = "backup";

    users = {
      ratoncio = import ./home/ratoncio.nix {
        inherit inputs pkgs unstable;
        config = { };
      };
    };
  };

  nix = {
    settings = {
      experimental-features = [ "nix-command" "flakes" ];
    };
  };
}
