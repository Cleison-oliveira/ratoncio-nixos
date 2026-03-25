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

    programs.plasma = {
      shortcuts = {
        "kwin" = {
          "Kill Window" = "Meta+Ctrl+Esc";
          "Overview" = "Meta+W";
          "Switch One Desktop Down" = "Meta+Ctrl+Down";
          "Switch One Desktop Up" = "Meta+Ctrl+Up";
          "Switch One Desktop to the Left" = "Meta+Ctrl+Left";
          "Switch One Desktop to the Right" = "Meta+Ctrl+Right";
          "Walk Through Windows" = ["Alt+Tab" "Meta+Tab"];
          "Walk Through Windows (Reverse)" = ["Alt+Shift+Tab" "Meta+Shift+Tab"];
          "Window Close" = "Alt+F4";
          "Window Maximize" = "Meta+PgUp";
          "Window Minimize" = "Meta+PgDown";
        };
        "plasmashell" = {
          "activate application launcher" = "Meta";
          "manage activities" = "Meta+Q";
          "show dashboard" = "Ctrl+F12";
        };
      };
    };
  };
}
