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
        ristretto
        xfce4-terminal
      ];
    };
  };
}
