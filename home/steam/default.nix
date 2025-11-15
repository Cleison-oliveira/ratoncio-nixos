{ pkgs, unstable, ... }: {
  imports = [
    ../common
  ];

  home = {
    username = "steam";
    homeDirectory = "/home/steam";
    stateVersion = "25.05";
    packages = import ./packages.nix { inherit pkgs unstable; };
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
