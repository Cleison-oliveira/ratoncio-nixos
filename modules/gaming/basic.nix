{
  flake.modules.homeManager.gaming-basic = {
    pkgs,
    pkgs-stable,
    ...
  }: {
    home.packages = with pkgs; [
      heroic
      mangohud
      prismlauncher
      protonup-qt
      steam-run
      steam-rom-manager
      umu-launcher
      gamescope
    ];
  };
}
