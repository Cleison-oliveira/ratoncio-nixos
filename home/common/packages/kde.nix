{ pkgs, ... }: with pkgs; {
  home = {
    packages = [
      kdePackages.qtstyleplugin-kvantum
      kdePackages.breeze-icons
    ];
  };
}
