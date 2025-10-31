{ config, pkgs, ... }: {

  nixpkgs = {
    config = {
      allowUnfree = true;
    };
  };

  environment = {
    systemPackages = with pkgs; [
      # Essentials / CLI tools
      wget
      curl
      tree
      fzf
      busybox
      gcc
      gnumake
      ripgrep
      fd
      htop
      appimage-run

      # Archive & Compression tools
      gnutar
      unzip
      p7zip
      unrar
      gzip
      bzip2
      xz
      libarchive
      mate.engrampa

      # Programming languages & Dev tools
      lua5_1
      R
      (python3.withPackages (ps: with ps; [ pynvim ]))
      luarocks-nix
      tree-sitter
      lua-language-server

      # Text Editor
      neovim

      # Multimedia
      ffmpeg-full
      yt-dlp
      mpv
      feh

      # Audio tools
      pulsemixer
      alsa-utils
      pulseaudio

      # Qt / KDE / Theming
      qt5.qtbase
      qt6.qtbase
      qt6Packages.qt6ct
      libsForQt5.qt5ct
      kdePackages.qtstyleplugin-kvantum
      libsForQt5.qtstyleplugin-kvantum
      kdePackages.okular
      adwaita-icon-theme
      hicolor-icon-theme
      kdePackages.breeze-icons

      # System integration utilities
      glib
      xdg-utils
      xdg-user-dirs
      dconf
      apparmor-utils
    ];
  };
}
