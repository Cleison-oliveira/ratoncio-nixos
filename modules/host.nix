{ config, pkgs, ... }: {
  imports = [
    ./hardware
    ./hardware/sane.nix
    ./services
    ./system
    ../users/ratoncio
    ./themes
    ./virtual
  ];

  system.stateVersion = "25.05";
  networking.hostName = "rataria";
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  boot.kernelPackages = pkgs.linuxPackages_latest;
  programs.git.enable = true;
}
