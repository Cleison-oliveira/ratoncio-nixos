{
  flake.modules.homeManager.desktop-plasma = {
    programs.plasma = let
      commonPanelProps = {
        floating = false;
        height = 45;
        hiding = "normalpanel";
        location = "bottom";
        opacity = "adaptive";
      };

      leftWidgets = [
        #"org.kde.plasma.marginsseparator"
        {
          name = "org.kde.plasma.kickoff";
          config.General = {
            icon = "nix-snowflake-white";
            alphaSort = true;
            systemFavorites = "suspend,reboot,shutdown";
          };
        }
      ];

      centerWidgets = [
        {
          iconTasks = {
            appearance.iconSpacing = "small";
            launchers = [
              "preferred://filemanager"
              "applications:google-chrome.desktop"
              "applications:org.kde.konsole.desktop"
              "applications:codium.desktop"
              "applications:org.telegram.desktop.desktop"
              "applications:davinci-resolve.desktop"
            ];
          };
        }
      ];

      rightWidgets = [
        {
          systemTray = {
            icons = {
              spacing = "small";
              scaleToFit = false;
            };
            items = {
              hidden = [
                "org.kde.plasma.devicenotifier"
                "org.kde.kscreen"
                "org.kde.plasma.keyboardlayout"
                "org.kde.plasma.battery"
                "org.kde.plasma.notifications"
              ];
            };
          };
        }
        {
          name = "org.kde.plasma.digitalclock";
          config.Appearance = {
            autoFontAndSize = false;
            fontFamily = "Noto Sans";
            fontStyleName = "Regular";
            fontWeight = "400";
            showSeconds = "0";
            use24hFormat = "2";

            dateDisplayFormat = "BesideTime";
            dateFormat = "custom";
            customDateFormat = "ddd, d MMM";

            firstDayOfWeek = "1";
            showWeekNumbers = true;
            enabledCalendarPlugins = "holidaysevents,astronomicalevents";
          };
        }
        "org.kde.plasma.marginsseparator"
        "org.kde.plasma.showdesktop"
      ];
    in {
      panels = [
        (commonPanelProps
          // {
            screen = 0;
            widgets =
              leftWidgets
              ++ ["org.kde.plasma.panelspacer"]
              ++ centerWidgets
              ++ ["org.kde.plasma.panelspacer"]
              ++ rightWidgets;
          })

        (commonPanelProps
          // {
            screen = 1;
            widgets =
              leftWidgets
              ++ ["org.kde.plasma.panelspacer"]
              ++ centerWidgets
              ++ ["org.kde.plasma.panelspacer"]
              ++ rightWidgets;
          })
      ];
    };
  };
}
