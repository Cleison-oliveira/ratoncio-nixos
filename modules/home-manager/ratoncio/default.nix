{ pkgs, unstable, ... }: {

  home = {
    username = "ratoncio";
    homeDirectory = "/home/ratoncio";
    stateVersion = "25.05";
    file = { };
    packages = import ./packages.nix { inherit pkgs unstable; };
  };

  programs = {
    git = {
      userName = "Cleison-oliveira";
      userEmail = "cleisonao59@gmail.com";
    };
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
