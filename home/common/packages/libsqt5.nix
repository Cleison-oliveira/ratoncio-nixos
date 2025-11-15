{ pkgs, ... }: with pkgs; {
  home = {
    packages = [
      libsForQt5.qtstyleplugins
      libsForQt5.qt5ct
      libsForQt5.qtstyleplugin-kvantum
      qt5.qtbase
      qt5.qtwayland
    ];
  };
}
