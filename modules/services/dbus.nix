{
  flake.modules.nixos.services-dbus = {pkgs, ...}: {
    services.dbus = {
      enable = true;
      packages = [pkgs.gcr];
    };
  };
}
