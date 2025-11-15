{ pkgs, ... }: with pkgs; {

  gtk = {
    enable = true;

    theme = {
      name = "catppuccin-mocha-blue-standard";
    };

    font = {
      name = "Ubuntu Nerd Font";
      size = 11;
    };

    gtk2 = {
      extraConfig = ''
        gtk-button-images = 0
        gtk-menu-images = 0
        gtk-enable-mnemonics = 0
      '';
    };

    gtk3 = {
      extraConfig = {
        gtk-button-images = 0;
        gtk-menu-images = 0;
      };
    };

    iconTheme = {
      name = "Papirus-Dark";
      package = catppuccin-papirus-folders;
    };
  };

  home = {
    pointerCursor = {
      name = "Breeze_Light";
      package = kdePackages.breeze;
      size = 24;
    };
  };
}
