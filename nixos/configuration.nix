{ pkgs, inputs, ... }:
{
  imports = [
    ./modules
  ];

  system.stateVersion = "26.05";
  boot.kernelPackages = pkgs.cachyosKernels.linuxPackages-cachyos-lts;
  networking.hostName = "rataria";

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    backupFileExtension = "backup";

    users.ratoncio = import ../home/ratoncio {
      inherit inputs pkgs;
      config = { };
    };
  };
}
