{ pkgs, unstable, ... }:
with pkgs;
[
  krita
  inkscape
  gimp3
  kdePackages.kdenlive
  vscodium
  xsel
  nixd
  nixfmt-rfc-style
  nixpkgs-fmt
  librewolf
  chromium
  discord
  telegram-desktop
  keet
  keepassxc
  onlyoffice-desktopeditors
  asciidoc-full-with-plugins
  antora
  simple-scan
  hplip
  freerdp
  remmina
]
++ (with unstable; [
  wasabiwallet
])
