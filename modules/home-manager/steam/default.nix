{ config, pkgs, unstable, ... }: {
  home.username = "steam";
  home.homeDirectory = "/home/steam";
  home.stateVersion = "25.05";

  home.packages = with pkgs; [
  ] ++ (with unstable; [

  ]);

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
