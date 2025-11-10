{ pkgs, unstable, ... }: {

  imports = [
    ../../common/home
  ];

  home = {
    username = "ratoncio";
    homeDirectory = "/home/ratoncio";
    stateVersion = "25.05";
    packages = import ./packages.nix { inherit pkgs unstable; };
  };

  programs = {
    git = {
      userName = "Cleison-oliveira";
      userEmail = "cleisonao59@gmail.com";
    };
  };
}
