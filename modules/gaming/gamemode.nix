{
  flake.modules.nixos.gaming-gamemode = {
    programs.gamemode = {
      enable = true;
      settings.general.inhibit_screensaver = 0;
    };
  };
}
