{ pkgs, ... }:
{
  home.packages = with pkgs; [
    ristretto
    mousepad
    xfce4-terminal
    exo
  ];
}
