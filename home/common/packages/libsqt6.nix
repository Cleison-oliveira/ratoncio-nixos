{ pkgs, ... }: with pkgs; {
  home = {
    packages = [
      qt6.qtbase
      qt6.qtwayland
      qt6Packages.qt6ct
    ];
  };
}
