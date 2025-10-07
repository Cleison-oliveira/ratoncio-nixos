{ config, pkgs, unstable, ... }:

{
  home.username = "ratoncio";
  home.homeDirectory = "/home/ratoncio";
  home.stateVersion = "25.05";

  home.packages = with pkgs; [
    yt-dlp
    krita
    inkscape
    gimp3
    antora
    vscodium
    librewolf
    chromium
<<<<<<< HEAD
    fastfetch
=======
>>>>>>> 0e212d2 (Add security modules)
    telegram-desktop
    keepassxc
    kdePackages.kdenlive
    nix-ld
    onlyoffice-desktopeditors
<<<<<<< HEAD
    gnome-disk-utility
=======
>>>>>>> 0e212d2 (Add security modules)
    asciidoc-full-with-plugins

  ] ++ (with unstable; [
    wasabiwallet
  ]);

  programs.git = {
    userName = "Cleison-oliveira";
    userEmail = "cleisonao59@gmail.com";
  };

  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };
}
