{ config, lib, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    wget
    gcc
    curl
    tree
    glib
    fzf
    gnumake

    qt5.qtbase
    qt6.qtbase
    qt6Packages.qt6ct
    kdePackages.qtstyleplugin-kvantum
    libsForQt5.qtstyleplugin-kvantum
    libsForQt5.qt5ct
    kdePackages.okular

    busybox
    gnutar
    unzip
    gnutar
    p7zip
    unrar
    gzip
    bzip2
    xz
    libarchive

    lua5_1
    luarocks-nix
    tree-sitter
    (python3.withPackages (ps: with ps; [ pynvim ]))
    lua-language-server
    htop
    ripgrep
    fd
    nixpkgs-fmt
    feh

    discord
    vim
    neovim

    ffmpeg-full
    yt-dlp
    mpv
    pulsemixer
    alsa-utils
    pulseaudio
    appimage-run

<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
    xfce.xfce4-terminal
    xfce.ristretto
=======
>>>>>>> 0e212d2 (Add security modules)
=======
>>>>>>> 05c057b (A stable config)
=======
>>>>>>> master
    mate.engrampa
    adwaita-icon-theme
    hicolor-icon-theme
    kdePackages.breeze-icons
    xdg-utils
    xdg-user-dirs
    dconf
<<<<<<< HEAD
<<<<<<< HEAD

=======
>>>>>>> 05c057b (A stable config)
=======
>>>>>>> master
  ];
}
