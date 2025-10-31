{ config, ... }: {
  environment = {
    variables = {
      GTK_THEME = "Catppuccin-Dark";
      GTK_ICON_THEME = "Papirus-Dark";
      XCURSOR_THEME = "Breeze_Light";
      XCURSOR_SIZE = "24";
    };
  };
}
