{ pkgs, unstable, ... }:
with pkgs;
[
  krita
  inkscape
  gimp3
  vscodium
  evince
  onlyoffice-desktopeditors
  xsel
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
