{ ... }: {
  dconf = {
    enable = true;
    settings = {
      "org/gnome/desktop/wm/preferences" = {
        button-layout = ":";
      };
      "org/gnome/desktop/interface" = {
        cursor-theme = "Breeze_Light";
      };
    };
  };
}
