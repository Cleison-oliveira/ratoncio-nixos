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
  onlyoffice-desktopeditors
  xsel
  nixd
  nixfmt-rfc-style
  nixpkgs-fmt
  chromium
  keet
  keepassxc
  simple-scan
  hplip
  freerdp
  remmina
]
++ (with unstable; [
  wasabiwallet
])
