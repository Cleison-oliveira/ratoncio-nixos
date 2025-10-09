{ ... }:

{
  imports = [
    ./hardware-configuration
    ./nixos
    ./sys-packages
    ./window-manager
    ./steam
    ./fish
    ./security
    ./networking
    ./virtualization
    ../users/ratoncio
    ./fonts
  ];
}
