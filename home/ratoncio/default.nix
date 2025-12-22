{ pkgs, inputs, ... }: {
  imports = [
    ../common
    inputs.noctalia.homeModules.default
  ];

  xdg.configFile."quickshell/noctalia-shell".source =
    "${inputs.noctalia.packages.${pkgs.stdenv.hostPlatform.system}.default}/share/noctalia-shell";

  home = {
    username = "ratoncio";
    homeDirectory = "/home/ratoncio";
    stateVersion = "26.05";
    packages = import ./packages.nix { inherit pkgs; };
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
