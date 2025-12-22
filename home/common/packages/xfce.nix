{ pkgs, ... }: with pkgs; {
  home = {
    packages = with xfce; [
      ristretto
      mousepad
      xfce4-terminal
      exo
    ];
  };
}
