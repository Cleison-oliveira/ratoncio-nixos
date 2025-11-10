{ ... }: {
  imports = [
    ./boot.nix
    ./environment.nix
    ./fonts.nix
    ./gc.nix
    ./groups.nix
    ./locale.nix
    ./network.nix
    ./packages.nix
    ./packages.nix
    ./security.nix
    ./timezone.nix
    ./xdg.nix
    ./zram.nix
  ];
  system = {
    stateVersion = "25.05";
  };
}
