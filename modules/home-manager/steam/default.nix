{ pkgs, unstable, ... }: {

  home = {
    username = "steam";
    homeDirectory = "/home/steam";
    stateVersion = "25.05";
    file = { };
    packages = import ./packages.nix { inherit pkgs unstable; };
  };

  xdg = {
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
  };
}
