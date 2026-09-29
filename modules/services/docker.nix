{
  flake.modules.nixos.services-docker = {
    pkgs,
    lib,
    ...
  }: {
    virtualisation.docker = {
      enable = true;
      autoPrune.enable = true;
      rootless = {
        enable = true;
        setSocketVariable = true;
      };
      extraPackages = [pkgs.docker-compose];
    };

    systemd.user.services.docker.unitConfig.ConditionUser = lib.mkForce "!@system";
    systemd.user.services.rootlesskit.unitConfig.ConditionUser = lib.mkForce "!@system";
  };
}
