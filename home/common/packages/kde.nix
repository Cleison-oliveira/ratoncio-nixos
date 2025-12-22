{ pkgs, ... }: with pkgs; {
  home = {
    packages = with kdePackages; [
      qtstyleplugin-kvantum
      breeze-icons
      kdenlive
    ];
  };
}
