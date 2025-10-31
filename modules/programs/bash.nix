{ config, pkgs, ... }: {
  programs = {
    bash = {
      completion = {
        enable = true;
      };
    };
  };
}
