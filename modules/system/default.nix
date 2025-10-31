{ ... }: {
  imports = [
    ./boot.nix
    ./environment.nix
    ./flatpak.nix
    ./fonts.nix
    ./gc.nix
    ./locale.nix
    ./network.nix
    ./packages.nix
    ./packages.nix
    ./security.nix
    ./timezone.nix
    ./xdg.nix
    ./zram.nix
  ];
}
