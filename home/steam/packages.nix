{ pkgs, unstable, ... }:

with pkgs; [
  mangohud
  lutris
  rpcs3
  pcsx2
  dolphin-emu
  protonup-qt
  steam-run
  mangojuice
  vulkan-tools
] ++ (with unstable; [
  lsfg-vk-ui
  lsfg-vk
  heroic
])
