{ pkgs, unstable, ... }: {

  imports = [
    ../common
  ];

  home = {
    username = "ratoncio";
    homeDirectory = "/home/ratoncio";
    stateVersion = "25.05";
    packages = import ./packages.nix { inherit pkgs unstable; };
    sessionVariables = { };
  };

  programs = {
    git = {
      userName = "Cleison-oliveira";
      userEmail = "cleisonao59@gmail.com";
    };
  };

  services = {
    hyprpaper = {
      enable = true;
      settings = {
        preload = [ "${./wallpaper.png}" ];
        wallpaper = [ "DP-3,${./wallpaper.png}" ];
      };
    };
  };
}
