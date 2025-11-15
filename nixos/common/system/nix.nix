{ ... }: {
  nixpkgs = {
    config = {
      allowUnfree = true;
      allowBroken = false;
    };
  };

  nix = {
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--max-freed 1G --delete-older-than 7d";
    };

    optimise = {
      automatic = true;
    };

    settings = {
      allowed-users = [ "@wheel" ];
      auto-optimise-store = true;
      sandbox = true;
    };
  };
}
