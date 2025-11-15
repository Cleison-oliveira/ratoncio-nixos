{ pkgs, ... }: with pkgs; {
  programs = {
    rofi = {
      enable = true;
      theme = "catppuccin-mocha";
      package = rofi-wayland;
      extraConfig = {
        modi = "drun,window";
        disable-history = true;
        sort = true;
        show-icons = true;
        icon-theme = "Papirus-Dark";
        terminal = "xfce4-terminal";
        drun-display-format = "{name}";
        location = 0;
        hide-scrollbar = true;
        display-drun = "   Apps ";
        display-window = "   Window";
        sidebar-mode = true;
      };
    };
  };
}
