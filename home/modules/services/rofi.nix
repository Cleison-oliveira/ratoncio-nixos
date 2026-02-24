{ pkgs, ... }:
let
  colors = {
    bg-col = "#1e1e2e";
    bg-col-light = "#1e1e2e";
    border-col = "#1e1e2e";
    selected-col = "#1e1e2e";
    blue = "#89b4fa";
    fg-col = "#cdd6f4";
    fg-col2 = "#89b4fa";
    grey = "#6c7086";
  };
  settings = {
    width = "600";
    font = "Ubuntu Nerd Font Regular 12";
  };
in
{
  programs = {
    rofi = {
      enable = true;
      theme = "catppuccin-mocha";
      package = pkgs.rofi;
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

  home.file.".local/share/rofi/themes/catppuccin-mocha.rasi".text = ''
    * {
        bg-col: ${colors.bg-col};
        bg-col-light: ${colors.bg-col-light};
        border-col: ${colors.border-col};
        selected-col: ${colors.selected-col};
        blue: ${colors.blue};
        fg-col: ${colors.fg-col};
        fg-col2: ${colors.fg-col2};
        grey: ${colors.grey};
        width: ${settings.width};
        font: "${settings.font}";
    }

    element-text, element-icon, mode-switcher {
        background-color: inherit;
        text-color: inherit;
    }

    window {
        height: 360px;
        border: 2px;
        border-radius: 0px;
        border-color: ${colors.blue};
        background-color: @bg-col;
        location: center;
    }

    mainbox { 
        background-color: @bg-col; 
    }

    inputbar {
        children: [prompt,entry];
        background-color: @bg-col;
        border-radius: 5px;
        padding: 2px;
    }

    prompt {
        background-color: @blue;
        padding: 6px;
        text-color: @bg-col;
        border-radius: 3px;
        margin: 20px 0px 0px 20px;
    }

    entry {
        padding: 6px;
        margin: 20px 0px 0px 10px;
        text-color: @fg-col;
        background-color: @bg-col;
    }

    listview {
        border: 0px 0px 0px;
        padding: 6px 0px 0px;
        margin: 10px 0px 0px 20px;
        columns: 2;
        lines: 5;
        background-color: @bg-col;
    }

    element {
        padding: 5px;
        background-color: @bg-col;
        text-color: @fg-col;
    }

    element-icon { 
        size: 25px; 
    }

    element selected {
        background-color: @selected-col;
        text-color: @fg-col2;
    }

    button {
        padding: 10px;
        background-color: @bg-col-light;
        text-color: @grey;
        vertical-align: 0.5;
        horizontal-align: 0.5;
    }

    button selected {
        background-color: @bg-col;
        text-color: @blue;
    }

    message {
        background-color: @bg-col-light;
        margin: 2px;
        padding: 2px;
        border-radius: 5px;
    }

    textbox {
        padding: 6px;
        margin: 20px 0px 0px 20px;
        text-color: @blue;
        background-color: @bg-col-light;
    }
  '';
}
