{ ... }: {
  imports = [
    ./boot.nix
    ./environment.nix
    ./fish.nix
    ./flatpak.nix
    ./fonts.nix
    ./locale.nix
    ./network.nix
    ./packages.nix
    ./packages.nix
    ./security.nix
    ./xdg.nix
  ];
}
