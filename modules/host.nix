{ config, pkgs, ... }: {
  imports = [
    ./hardware
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
  boot.kernelModules = [ "kvm-amd" "tun" ];
  programs.git.enable = true;

  hardware.sane.enable = true;
  hardware.sane.extraBackends = [ pkgs.hplipWithPlugin ];
}
