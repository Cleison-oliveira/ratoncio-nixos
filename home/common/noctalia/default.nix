{ ... }: {
  programs = {
    noctalia-shell = {
      enable = true;
      colors = import ./colors.nix;
      settings = import ./settings.nix;
    };
  };
}
