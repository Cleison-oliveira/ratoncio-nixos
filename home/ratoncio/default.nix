{ pkgs, unstable, ... }: {
  imports = [
    ../common
  ];

  home = {
    username = "ratoncio";
    homeDirectory = "/home/ratoncio";
    stateVersion = "25.11";
    packages = import ./packages.nix { inherit pkgs unstable; };
    sessionVariables = { };
  };

  services = {
    hyprpaper = {
      enable = true;
      settings = {
        preload = [ "${./wallpaper.png}" ];
        wallpaper = [ 
          "DP-2,${./wallpaper.png}" 
          "DP-3,${./wallpaper.png}" 
        ];
      };
    };
  };
}
