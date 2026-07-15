{
  flake.modules.nixos.sane = {pkgs, ...}: {
    hardware.sane = {
      enable = true;
      extraBackends = with pkgs; [
        hplip
        hplipWithPlugin
      ];
    };
  };
}
