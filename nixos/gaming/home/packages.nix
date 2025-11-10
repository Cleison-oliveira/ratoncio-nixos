{ pkgs, unstable, ... }:

with pkgs; [
  discord
  chromium
  telegram-desktop
  kdePackages.kdenlive
  mangohud
  gpu-screen-recorder-gtk
  lutris
  heroic
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
])
