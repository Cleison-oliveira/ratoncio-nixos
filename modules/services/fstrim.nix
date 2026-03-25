{
  flake.modules.nixos.services-fstrim = {
    services.fstrim.enable = true;
  };
}
