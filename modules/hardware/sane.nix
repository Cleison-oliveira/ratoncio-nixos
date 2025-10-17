{ config, pkgs, ... }: {
  services = {
    printing = {
      enable = true;
      drivers = [ pkgs.hplipWithPlugin ];
    };
  };

  hardware = {
    sane = {
      enable = false;
      extraBackends = [ pkgs.hplipWithPlugin ];
    };
  };
}
