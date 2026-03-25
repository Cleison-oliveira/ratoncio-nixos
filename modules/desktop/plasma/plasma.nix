{inputs, ...}: {
  flake.modules.nixos.desktop-plasma = {pkgs, ...}: {
    services = {
      desktopManager.plasma6.enable = true;
      displayManager.sddm = {
        enable = true;
        wayland.enable = true;
      };
    };
    environment.plasma6.excludePackages = with pkgs.kdePackages; [
      discover
    ];
  };

  flake.modules.homeManager.desktop-plasma = {pkgs, ...}: {
    imports = [
      inputs.self.modules.homeManager.plasma-manager
    ];

    programs.plasma = {
      enable = true;
      immutableByDefault = true;
      overrideConfig = false;

      desktop = {
        icons = {
          alignment = "left";
          arrangement = "topToBottom";
          lockInPlace = true;
        };
        widgets = [];
      };

      workspace = {
        clickItemTo = "select";
        colorScheme = "BreezeDark";
        lookAndFeel = "org.kde.breezedark.desktop";
        iconTheme = "breeze-dark";
        theme = "breeze-dark";
        cursor = {
          theme = "breeze_cursors";
          size = 24;
        };
      };

      kwin = {
        effects = {
          blur.enable = true;
          dimAdminMode.enable = false;
          wobblyWindows.enable = false;
          minimization.animation = "squash";
        };

        nightLight = {
          enable = true;
          mode = "times";
          temperature.night = 4500;
          transitionTime = 30;
          time = {
            morning = "0630";
            evening = "1830";
          };
        };

        titlebarButtons = {
          left = [];
          right = [
            "minimize"
            "maximize"
            "close"
          ];
        };
        virtualDesktops = {
          number = 4;
          rows = 1;
          names = [
            "Desktop 1"
            "Desktop 2"
            "Desktop 3"
            "Desktop 4"
          ];
        };
      };
    };
    home.packages = with pkgs.kdePackages; [
      breeze-icons
      elisa
      kcalc
      kdenlive
      konsole
      krdc
      plasma-browser-integration
      spectacle
      ffmpegthumbs
      kdegraphics-thumbnailers
    ];

    home = {
      pointerCursor = {
        name = "breeze_cursors";
        package = pkgs.kdePackages.breeze;
        size = 24;
        x11.enable = true;
        gtk.enable = true;
      };
      sessionVariables = {
        XCURSOR_THEME = "breeze_cursors";
        XCURSOR_SIZE = "24";
      };
    };
  };
}
