{ pkgs, ... }:
{
  home.packages = with pkgs; [
    qt6.qtbase
    qt6.qtwayland
    qt6Packages.qt6ct
  ];
}
