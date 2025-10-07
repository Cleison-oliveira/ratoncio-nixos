{ pkgs, unstable }:

with pkgs;

[
  discord
  chromium
  telegram-desktop
  kdePackages.kdenlive
  mangohud
  lutris
  heroic
  rpcs3
  pcsx2
  dolphin-emu
  protonup-qt
  git
  steam-run
  mangojuice
  vulkan-tools
  steam-rom-manager
  umu-launcher
] ++ (with unstable; [
  lsfg-vk-ui
  lsfg-vk
])

