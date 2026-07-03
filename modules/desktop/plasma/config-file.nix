{
  flake.modules.homeManager.desktop-plasma = {lib, ...}: {
    programs.plasma = {
      configFile = {
        "dolphinrc" = {
          "PreviewSettings" = {
            "Plugins" = lib.concatStringsSep "," [
              "audiothumbnail"
              "comicbookthumbnail"
              "cursorthumbnail"
              "djvuthumbnail"
              "ebookthumbnail"
              "exrthumbnail"
              "fontthumbnail"
              "imagethumbnail"
              "jpegthumbnail"
              "kraorathumbnail"
              "localfilethumbnail"
              "svgthumbnail"
              "textthumbnail"
              "windowsexethumbnail"
              "windowsimagethumbnail"
              "ffmpegthumbs"
            ];
          };
        };

        "kded5rc"."Module-browserintegrationreminder"."autoload" = false;
        "kded6rc"."Module-browserintegrationreminder"."autoload" = false;

        "kdeglobals" = {
          "General" = {
            "UseSystemBell" = true;
          };
          "KDE" = {
            "contrast" = 4;
            "frameContrast" = "0.2";
          };
          "KDE Action Restrictions" = {
            "action/hibernate" = false;
            "action/suspend" = false;
          };
          "KFileDialog Settings" = {
            "Automatically select filename extension" = true;
            "Show hidden files" = false;
            "Sort directories first" = true;
            "View Style" = "DetailTree";
          };
          "WM" = {
            "activeBackground" = "39,44,49";
            "activeBlend" = "252,252,252";
            "activeForeground" = "252,252,252";
            "inactiveBackground" = "32,36,40";
            "inactiveBlend" = "161,169,177";
            "inactiveForeground" = "161,169,177";
          };
        };

        "klaunchrc" = {
          "BusyCursorSettings" = {"Bouncing" = false;};
          "FeedbackStyle" = {"BusyCursor" = false;};
        };

        ksmserverrc.General = {
          loginMode = "emptySession";
        };

        kwinrc = {
          Desktops = {
            Number.value = 4;
          };

          #"NightColor" = {"Active" = false;};
          "Plugins" = {"shakecursorEnabled" = false;};
          "Xwayland" = {"Scale" = 1;};
        };
      };
    };
  };
}
