{ pkgs, unstable, ... }:
with pkgs;
[
  krita
  inkscape
  gimp3
  discord
  vscodium
  neovim
  telegram-desktop
  kdePackages.kdenlive
  evince
  gpu-screen-recorder-gtk
  onlyoffice-desktopeditors
  xsel
  keet
  nixd
  nixfmt-rfc-style
  nixpkgs-fmt
  chromium
  keepassxc
  simple-scan
  hplip
  freerdp
  remmina
]
++ (with unstable; [
  wasabiwallet
])
