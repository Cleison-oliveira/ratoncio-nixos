{
  flake.modules.nixos.cli-bash = {
    programs.bash = {
      enable = true;
      completion.enable = true;
      enableLsColors = true;
    };
  };
}
