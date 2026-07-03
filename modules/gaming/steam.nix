{
  flake.modules.nixos.gaming-steam = {pkgs, ...}: {
    programs.steam = {
      enable = true;
      package = pkgs.steam.override {
        extraEnv = {
          MANGOHUD = true;
          GAMEMODERUN = "1";
          ENABLE_VKBASALT = false;
          PROTON_USE_NTSYNC = true;
          PROTON_USE_WOW64 = true;
          PROTON_ENABLE_WAYLAND = true;
          PROTON_PREFER_SDL = true;
          SDL_AUDIODRIVER = "pipewire";
          SDL_VIDEODRIVER = "wayland";
        };
      };
      remotePlay.openFirewall = true;
      dedicatedServer.openFirewall = true;
      localNetworkGameTransfers.openFirewall = true;
      protontricks.enable = true;
      extraCompatPackages = [pkgs.proton-ge-bin];
    };
    services.udev.extraRules = ''
      KERNEL=="ntsync", MODE="0644"
    '';
  };
  flake.modules.homeManager.gaming-steam = {
    pkgs,
    config,
    ...
  }: {
    systemd.user.paths.steam-sweep = {
      Unit = {
        Description = "Monitor creation of Steam desktop shortcuts";
      };
      Install = {
        WantedBy = ["default.target"];
      };
      Path = {
        PathChanged = "${config.home.homeDirectory}/.local/share/applications";
      };
    };

    systemd.user.services.steam-sweep = {
      Unit = {
        Description = "Remove Steam game .desktop shortcuts";
      };
      Service = {
        Type = "oneshot";
        ExecStart = "${pkgs.findutils}/bin/find ${config.home.homeDirectory}/.local/share/applications/ -type f -name '*.desktop' -exec ${pkgs.gnugrep}/bin/grep -l 'Exec=steam steam://rungameid/' {} \\; -delete";
      };
    };
  };
}
