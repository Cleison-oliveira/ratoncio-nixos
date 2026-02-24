{ ... }:
{
  imports = [
    ./boot.nix
    ./documentation.nix
    ./environment.nix
    ./fonts.nix
    ./locale.nix
    ./network.nix
    ./nix.nix
    ./packages.nix
    ./security.nix
    ./timezone.nix
    ./virtualisation.nix
    ./zram.nix
  ];
}
