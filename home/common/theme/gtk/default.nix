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

    gtk2.extraConfig = ''
      gtk-button-images = 0
      gtk-menu-images = 0
      gtk-enable-mnemonics = 0

      style "no-focus"
      {
      GtkWidget::focus-line-width = 0
      GtkWidget::focus-padding = 0
      GtkButton::default-border = { 0, 0, 0, 0 }
      GtkButton::default-outside-border = { 0, 0, 0, 0 }

      engine "murrine" {
      focusstyle = 0
      }
      }

      class "GtkWidget" style "no-focus"
      class "GtkButton" style "no-focus"
    '';

    # GTK3
    gtk3.extraConfig = {
      gtk-button-images = 0;
      gtk-menu-images = 0;
    };

    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.catppuccin-papirus-folders;
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
