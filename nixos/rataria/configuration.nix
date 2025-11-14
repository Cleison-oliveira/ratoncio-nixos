{ pkgs, unstable, inputs, ... }: with pkgs; {

  imports = [
    ../common
    ./hardware
    ./users
    ./virtual
    inputs.home-manager.nixosModules.home-manager
  ];

  boot.kernelPackages = linuxPackages_latest;

  networking = {
    hostName = "rataria";
  };

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    backupFileExtension = "backup";

    users = {
      ratoncio = import ../../home/ratoncio {
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
