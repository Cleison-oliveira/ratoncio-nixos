{
  flake.modules.nixos.desktop-xdg = {pkgs, ...}: {
    environment = {
      pathsToLink = [
        "/share/applications"
        "/share/xdg-desktop-portal"
      ];
    };

    xdg = {
      portal = {
        enable = true;
        extraPortals = [pkgs.kdePackages.xdg-desktop-portal-kde];
        config.common.default = ["kde"];
      };
    };
  };

  flake.modules.homeManager.desktop-xdg = {pkgs, ...}: {
    xdg = {
      portal = {
        enable = true;
        extraPortals = [pkgs.kdePackages.xdg-desktop-portal-kde];
        config.common.default = ["kde"];
      };

      userDirs = {
        enable = true;
        createDirectories = true;
        desktop = "\$HOME/Desktop";
        documents = "\$HOME/Documents";
        download = "\$HOME/Downloads";
        music = "\$HOME/Music";
        pictures = "\$HOME/Pictures";
        publicShare = "\$HOME/Public";
        templates = "\$HOME/Templates";
        videos = "\$HOME/Videos";
      };

      configFile."mimeapps.list".force = true;
      mimeApps = let
        google-chrome = "google-chrome.desktop";
        discord = "discord.desktop";
        gimp = "gimp.desktop";
        codium = "codium.desktop";
        gwenview = "org.kde.gwenview.desktop";
        inkscape = "org.inkscape.Inkscape.desktop";
        krita = "krita_psd.desktop";
        haruna = "org.kde.haruna.desktop";
        neovim = "nvim.desktop";
        dolphin = "org.kde.dolphin.desktop";
        okular = "org.kde.okular.desktop";
        elisa = "org.kde.elisa.desktop";
      in {
        enable = true;
        associations.added = {
          "application/pdf" = [okular];
          "application/vnd.ms-publisher" = [codium neovim];
          "application/x-extension-htm" = [google-chrome];
          "application/x-extension-html" = [google-chrome];
          "application/x-extension-shtml" = [google-chrome];
          "application/x-extension-xht" = [google-chrome];
          "application/x-extension-xhtml" = [google-chrome];
          "application/xhtml+xml" = [google-chrome];
          "application/xml" = [codium neovim];
          "audio/aac" = [elisa];
          "audio/flac" = [elisa];
          "audio/mp4" = [elisa];
          "audio/mpeg" = [elisa];
          "audio/ogg" = [elisa];
          "audio/vorbis" = [elisa];
          "audio/x-wav" = [elisa];
          "image/gif" = [gwenview];
          "image/jpeg" = [gwenview];
          "image/png" = [gwenview];
          "image/svg+xml" = [inkscape];
          "image/vnd.adobe.photoshop" = [krita];
          "image/webp" = [gwenview];
          "image/x-eps" = [inkscape];
          "image/x-xcf" = [gimp];
          "inode/directory" = [dolphin];
          "text/html" = [google-chrome];
          "text/markdown" = [codium neovim];
          "text/plain" = [neovim codium];
          "text/uri-list" = [google-chrome];
          "video/mp4" = [haruna];
          "video/ogg" = [haruna];
          "video/webm" = [haruna];
          "video/x-flv" = [haruna];
          "video/x-matroska" = [haruna];
          "video/x-ms-wmv" = [haruna];
          "video/x-ogm+ogg" = [haruna];
          "video/x-theora+ogg" = [haruna];
          "x-scheme-handler/about" = [google-chrome];
          "x-scheme-handler/chrome" = [google-chrome];
          "x-scheme-handler/discord" = [discord];
          "x-scheme-handler/ftp" = [google-chrome];
          "x-scheme-handler/http" = [google-chrome];
          "x-scheme-handler/https" = [google-chrome];
          "x-scheme-handler/unknown" = [google-chrome];
        };
        defaultApplications = {
          "application/pdf" = [okular];
          "application/vnd.ms-publisher" = [codium neovim];
          "application/x-extension-htm" = [google-chrome];
          "application/x-extension-html" = [google-chrome];
          "application/x-extension-shtml" = [google-chrome];
          "application/x-extension-xht" = [google-chrome];
          "application/x-extension-xhtml" = [google-chrome];
          "application/xhtml+xml" = [google-chrome];
          "application/xml" = [codium neovim];
          "audio/aac" = [elisa];
          "audio/flac" = [elisa];
          "audio/mp4" = [elisa];
          "audio/mpeg" = [elisa];
          "audio/ogg" = [elisa];
          "audio/vorbis" = [elisa];
          "audio/x-wav" = [elisa];
          "image/gif" = [gwenview];
          "image/jpeg" = [gwenview];
          "image/png" = [gwenview];
          "image/svg+xml" = [inkscape];
          "image/vnd.adobe.photoshop" = [krita];
          "image/webp" = [gwenview];
          "image/x-eps" = [inkscape];
          "image/x-xcf" = [gimp];
          "inode/directory" = [dolphin];
          "text/html" = [google-chrome];
          "text/markdown" = [codium neovim];
          "text/plain" = [neovim codium];
          "text/uri-list" = [google-chrome];
          "video/mp4" = [haruna];
          "video/ogg" = [haruna];
          "video/webm" = [haruna];
          "video/x-flv" = [haruna];
          "video/x-matroska" = [haruna];
          "video/x-ms-wmv" = [haruna];
          "video/x-ogm+ogg" = [haruna];
          "video/x-theora+ogg" = [haruna];
          "x-scheme-handler/about" = [google-chrome];
          "x-scheme-handler/chrome" = [google-chrome];
          "x-scheme-handler/discord" = [discord];
          "x-scheme-handler/ftp" = [google-chrome];
          "x-scheme-handler/http" = [google-chrome];
          "x-scheme-handler/https" = [google-chrome];
          "x-scheme-handler/unknown" = [google-chrome];
        };
      };
    };
    home.packages = [pkgs.xdg-utils];
  };
}
