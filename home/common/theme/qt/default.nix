{ pkgs, ... }:
let
  theme = "catppuccin-mocha-blue";
  color = "catppuccin-mocha-blue.conf";
in
{
  xdg.configFile = {
    "Kvantum/kvantum.kvconfig".text = ''
      [General]
      theme=${theme}
    '';

    "Kvantum/${theme}/${theme}.svg".source = ./catppuccin-mocha-blue.svg;
    "Kvantum/${theme}/${theme}.kvconfig".source = ./catppuccin-mocha-blue.kvconfig;

    "qt5ct/qt5ct.conf".source = ./qt5ct.conf;
    "qt5ct/colors/${color}".source = ./${color};

    "qt6ct/qt6ct.conf".source = ./qt6ct.conf;
    "qt6ct/colors/${color}".source = ./${color};

  };

  home = {
    packages = with pkgs; [
      adwaita-icon-theme
      hicolor-icon-theme
    ];
  };
}
