{ pkgs, ... }:
{
  home.packages = with pkgs; with kdePackages; [
    qtstyleplugin-kvantum
    breeze-icons
    kdenlive
    skanlite
  ];
}
