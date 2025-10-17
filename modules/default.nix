{ ... }:

{
  imports = [
    ./nixos
    ./packages
    ./window-manager
    ./steam
    ./fish
    ./security
    ./networking
    ./virtualization
    ../users/ratoncio
    ./fonts
    ./hardware
    ./hardware/sane.nix
  ];
}
