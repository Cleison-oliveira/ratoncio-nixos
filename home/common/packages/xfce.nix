{ pkgs, ... }: with pkgs; {
  home = {
    packages = with xfce; [
      xfce4-terminal
      ristretto
    ];
  };
}
