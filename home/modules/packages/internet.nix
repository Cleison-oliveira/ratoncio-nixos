{ pkgs, ... }:
{
  home.packages = with pkgs; [
    freerdp
    remmina
    keet
    librewolf
    discord
    telegram-desktop
    google-chrome
    librewolf
  ];
}
