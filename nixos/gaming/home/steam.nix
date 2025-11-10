{ pkgs, unstable, ... }: {

  imports = [
    ../../common/home
  ];

  home = {
    username = "steam";
    homeDirectory = "/home/steam";
    stateVersion = "25.05";
    packages = import ./packages.nix { inherit pkgs unstable; };
  };
}
