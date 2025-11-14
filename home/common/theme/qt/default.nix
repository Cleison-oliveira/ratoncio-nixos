{ pkgs, ... }: {

  home = {
    file = {
      ".config/Kvantum/kvantum.kvconfig".text =
        builtins.readFile ./kvantum.kvconfig;

        ".config/Kvantum/catppuccin-mocha-blue/catppuccin-mocha-blue.svg".text =
          builtins.readFile ./catppuccin-mocha-blue.svg;

          ".config/Kvantum/catppuccin-mocha-blue/catppuccin-mocha-blue.kvconfig".text =
            builtins.readFile ./catppuccin-mocha-blue.kvconfig;
          };

          packages = with pkgs; [
            libsForQt5.qtstyleplugins
            kdePackages.breeze-icons
            qt5.qtbase
            qt6.qtbase
            qt5.qtwayland
            qt6.qtwayland
            qt6Packages.qt6ct
            libsForQt5.qt5ct
            kdePackages.qtstyleplugin-kvantum
            libsForQt5.qtstyleplugin-kvantum
            adwaita-icon-theme
            hicolor-icon-theme
          ];
        };
      }
