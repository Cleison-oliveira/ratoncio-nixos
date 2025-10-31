{ config, pkgs, ... }: {
  imports = [
    ./hardware
    ./programs
    ./services
    ./system
    ../users/ratoncio
    ./themes
    ./virtual
  ];

  system = {
    stateVersion = "25.05";
  };

  networking = {
    hostName = "rataria";
  };

  nix = {
    settings = {
      experimental-features = [ "nix-command" "flakes" ];
    };
  };

  hardware = {
    sane = {
      enable = true;
      extraBackends = with pkgs; [ hplipWithPlugin ];
    };
  };
}
