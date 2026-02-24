{ pkgs, ... }:
{
  home.packages = with pkgs; [
    lsfg-vk
    lsfg-vk-ui
    heroic
    steam-run
    mangohud
    rpcs3
    pcsx2
    dolphin-emu
    protonup-qt
    prismlauncher
    clonehero
    umu-launcher
  ];
}
