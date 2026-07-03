{
  flake.modules.homeManager.desktop-vscodium = {pkgs, ...}: {
    programs.vscodium = {
      enable = true;
      package = pkgs.vscodium.override {
        commandLineArgs = [
          "--enable-features=UseOzonePlatform"
          "--ozone-platform=wayland"
          "--disable-gpu"
        ];
      };
      profiles.default.userSettings = {
        "window.titleBarStyle" = "native";
      };
    };
  };
}
