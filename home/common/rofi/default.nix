{ ... }: {

  home = {
    file = {
      ".config/rofi/config.rasi".text =
        builtins.readFile ./config.rasi;

      ".local/share/rofi/themes/catppuccin-mocha.rasi".text =
        builtins.readFile ./catppuccin-mocha.rasi;
    };
  };
}
