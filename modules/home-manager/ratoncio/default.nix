{ config, pkgs, unstable, ... }:

{
  home.username = "ratoncio";
  home.homeDirectory = "/home/ratoncio";
  home.stateVersion = "25.05";

  home.packages = with pkgs; [
    krita
    inkscape
    gimp3
    antora
    vscodium
    librewolf
    chromium
    keepassxc
    kdePackages.kdenlive
    asciidoc-full-with-plugins
    keet
    simple-scan
  ] ++ (with unstable; [
    wasabiwallet
  ]);

  programs.git = {
    userName = "Cleison-oliveira";
    userEmail = "cleisonao59@gmail.com";
  };

  xdg.userDirs = {
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

  home.file = { };
}
