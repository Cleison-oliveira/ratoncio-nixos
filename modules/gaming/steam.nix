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
          PRESSURE_VESSEL_IMPORT_OPENXR_1_RUNTIMES = true;
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
}
