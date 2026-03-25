{inputs, ...}: {
  flake.modules.homeManager.desktop-plasma = {
    config,
    lib,
    pkgs,
    ...
  }: {
    imports = [
      inputs.self.modules.homeManager.plasma-manager
    ];

    programs.plasma = let
      commonPanelProps = {
        floating = true;
        height = 46;
        hiding = "dodgewindows";
        location = "bottom";
        opacity = "adaptive";
      };

      leftWidgets = [
        {
          name = "org.kde.plasma.kickoff";
          config.General = {
            alphaSort = true;
            systemFavorites = "suspend,reboot,shutdown";
          };
        }
        "org.kde.plasma.marginsseparator"
        {
          iconTasks = {
            appearance.iconSpacing = "small";
            launchers = [
              "preferred://filemanager"
              "applications:google-chrome.desktop"
              "applications:org.kde.konsole.desktop"
              "applications:codium.desktop"
            ];
          };
        }
      ];

      centerWidgets = [
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
      ];

      rightWidgets = [
        {
          systemTray = {
            icons = {
              spacing = "small";
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
