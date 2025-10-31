{ pkgs, ... }: {
  programs = {
    xfconf = {
      enable = true;
    };

    thunar = {
      enable = true;
      plugins = with pkgs.xfce; [
        thunar-archive-plugin
        thunar-volman
        xfce4-terminal
        ristretto
      ];
    };
  };
}
