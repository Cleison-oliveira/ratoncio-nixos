{ pkgs, unstable, ... }:
with pkgs;
[
  # Creative / Design & Media
  krita
  inkscape
  gimp3
  kdePackages.kdenlive

  # Development Tools
  vscodium
  # nodejs_22
  # pnpm
  xsel
  nixfmt-rfc-style
  nixpkgs-fmt

  # Web Browsers
  librewolf
  chromium

  # Communication
  discord
  telegram-desktop
  keet

  # Security / Passwords
  keepassxc

  # Office / Documentation
  onlyoffice-desktopeditors
  asciidoc-full-with-plugins
  antora

  # Scanning / Printing
  simple-scan
  hplip

  # Remote Access
  freerdp
  remmina
]
++ (with unstable; [
  # Crypto / Finance
  wasabiwallet
])
