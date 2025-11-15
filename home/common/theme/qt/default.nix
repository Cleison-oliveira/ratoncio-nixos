{ pkgs, ... }:
let
  theme = "catppuccin-mocha-blue";
in
{
  xdg.configFile = {
    "Kvantum/kvantum.kvconfig".text = ''
      [General]
      theme=${theme}
    '';

    "Kvantum/${theme}/${theme}.svg".source = ./catppuccin-mocha-blue.svg;
    "Kvantum/${theme}/${theme}.kvconfig".source = ./catppuccin-mocha-blue.kvconfig;
  };

  home = {
    packages = with pkgs; [
      adwaita-icon-theme
      hicolor-icon-theme
    ];
  };
}
