{
  flake.modules.nixos.services-clamav = {pkgs, ...}: {
    services.clamav = {
      daemon.enable = true;
      updater.enable = true;
    };

    environment.systemPackages = with pkgs; [
      clamav
    ];
  };
}
