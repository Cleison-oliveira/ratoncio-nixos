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
    telegram-desktop
    keepassxc
    kdePackages.kdenlive
    onlyoffice-desktopeditors
    asciidoc-full-with-plugins
    keet
  ] ++ (with unstable; [
    wasabiwallet
  ]);

  home.sessionVariables = {
    # Session
    XDG_CURRENT_DESKTOP = "i3";
    XDG_SESSION_DESKTOP = "i3";
    XDG_SESSION_TYPE = "x11";

    # GTK Theme
    GTK_THEME = "Catppuccin-Mocha-Standard-Mauve-Dark";
    GTK_ICON_THEME = "Papirus-Dark";

    XCURSOR_SIZE = "24";
    XCURSOR_THEME = "Breeze_Light";

    QT_QPA_PLATFORMTHEME = "qt6ct";

    EDITOR = "nvim";
  };

  programs.git = {
    userName = "Cleison-oliveira";
    userEmail = "cleisonao59@gmail.com";
  };

  xdg.userDirs = {
    enable = true;
    createDirectories = true;
    desktop = "\$HOME/desktop";
    documents = "\$HOME/documents";
    download = "\$HOME/downloads";
    music = "\$HOME/music";
    pictures = "\$HOME/pictures";
    publicShare = "\$HOME/public";
    templates = "\$HOME/templates";
    videos = "\$HOME/videos";
  };

  home.file = { };
}
