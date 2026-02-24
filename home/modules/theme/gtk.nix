{ pkgs, ... }:
let
  noRoundedCornersCss = ''
    .csd .titlebar {
      border-radius: 0;
    }
    .window-frame {
      border-radius: 0;
    }

    decoration, window, window.background, window.titlebar, * {
      border-radius: 0px;
    }

    .titlebar,
    .titlebar .background, * {
      border-top-left-radius: 0px;
      border-top-right-radius: 0px;
      border-bottom-left-radius: 0px;
      border-bottom-right-radius: 0px;
    }

    .window-frame {
      border-radius: 0 0 0 0;
    }

    .background.csd {
      border-radius: 0 0 0px 0px;
    }
    .background.maximized, .background.solid-csd {
      border-radius: 0;
    }

    .window-frame, .window-frame:backdrop {
      box-shadow: 0 0 0 black;
      border-style: none;
      margin: 0;
      border-radius: 0;
    }

    .titlebar {
      border-radius: 0;
    }

    checkbutton check,
    check {
      border-radius: 3px;
    }

    radiobutton radio,
    radio {
      border-radius: 100%;
    }
  '';
in
{
  gtk = {
    enable = true;
    theme = {
      name = "catppuccin-mocha-blue-compact";
      package = pkgs.catppuccin-gtk.override {
        accents = [ "blue" ];
        variant = "mocha";
        size = "compact";
      };
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
      bookmarks = [
        "file:///home/ratoncio/Documents"
        "file:///home/ratoncio/Downloads"
        "file:///home/ratoncio/Music"
        "file:///home/ratoncio/Pictures"
        "file:///home/ratoncio/Public"
        "file:///home/ratoncio/Templates"
        "file:///home/ratoncio/Videos"
      ];
      extraConfig = {
        gtk-button-images = 0;
        gtk-menu-images = 0;
      };
      extraCss = noRoundedCornersCss;
    };
    gtk4 = {
      extraConfig = {
        gtk-application-prefer-dark-theme = "true";
        gtk-xft-antialias = 1;
        gtk-xft-hinting = 1;
        gtk-xft-hintstyle = "hintslight";
        gtk-xft-rgba = "none";
        gtk-xft-dpi = 98304;
        gtk-overlay-scrolling = "true";
      };
      extraCss = ''
        .titlebar,
        .titlebar .background
        {
        border-radius: 0;
        }

          decoration
          {
            box-shadow: none;
          }

          decoration:backdrop
          {
            box-shadow: none;
          }
      '';
    };

    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.catppuccin-papirus-folders;
    };
  };
  home.pointerCursor = {
    name = "Breeze_Light";
    package = pkgs.kdePackages.breeze;
    size = 24;
  };
}
