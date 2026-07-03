{
  flake.modules.homeManager.cli-btop = {
    programs.btop = {
      enable = true;
      settings = {
        color_theme = "dracula";
        vim_mode = true;
        update_ms = 2000;
      };
    };
  };
}
