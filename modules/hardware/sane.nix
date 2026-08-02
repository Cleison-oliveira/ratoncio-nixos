{
  flake.modules.nixos.hardware-sane = {pkgs, ...}: {
    hardware.sane = {
      enable = true;
      extraBackends = with pkgs; [
        hplip
        hplipWithPlugin
      ];
    };
  };
}
