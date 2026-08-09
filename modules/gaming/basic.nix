{
  flake.modules.homeManager.gaming-basic = {pkgs, ...}: let
  in {
    home.packages = with pkgs; [
      dolphin-emu
      faugus-launcher
      heroic
      mangohud
      prismlauncher
      protonup-qt
      steam-run
      umu-launcher
      gamescope
      rpcs3
    ];
  };
}
