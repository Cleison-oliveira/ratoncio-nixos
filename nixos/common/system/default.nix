{ ... }: {
  imports = [
    ./boot.nix
    ./documentation.nix
    ./environment.nix
    ./fonts.nix
    ./groups.nix
    ./locale.nix
    ./network.nix
    ./nix.nix
    ./packages.nix
    ./packages.nix
    ./security.nix
    ./timezone.nix
    ./xdg.nix
    ./zram.nix
  ];
  system = {
    stateVersion = "25.11";
  };
}
