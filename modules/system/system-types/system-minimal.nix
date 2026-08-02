{
  flake-file.inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-26.05";
  };

  flake.modules.nixos.system-minimal = {
    config,
    pkgs,
    inputs,
    ...
  }: {
    _module.args.pkgs-stable = import inputs.nixpkgs-stable {
      inherit (pkgs.stdenv.hostPlatform) system;
      config.allowUnfree = true;
    };

    nixpkgs.config.allowUnfree = true;
    system.stateVersion = "26.05";

    nix = {
      optimise.automatic = true;
      settings = {
        experimental-features = [
          "nix-command"
          "flakes"
        ];
        trusted-users = ["root" "@wheel"];
        allowed-users = ["@wheel"];
        auto-optimise-store = true;
        sandbox = true;
        substituters = [
          "https://cache.nixos.org"
          "https://cache.nixos-cuda.org"
          "https://cuda-maintainers.cachix.org"
          "https://comfyui.cachix.org"
          "https://attic.xuyh0120.win/lantian"
          "https://xddxdd.cachix.org"
        ];
        trusted-public-keys = [
          "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
          "comfyui.cachix.org-1:33mf9VzoIjzVbp0zwj+fT51HG0y31ZTK3nzYZAX0rec="
          "cache.nixos-cuda.org:74DUi4Ye579gUqzH4ziL9IyiJBlDpMRn9MBN8oNan9M="
          "cuda-maintainers.cachix.org-1:0dq3bujKpuEPMCX6U4WylrUDZ9JyUG0VpVZa7CNfq5E="
          "lantian:EeAUQ+W+6r7EtwnmYjeVwx5kOGEBpjlBfPlzGlTNvHc="
          "xddxdd.cachix.org-1:EkS3jKUuG1cg+SrgC1E0p00i4B+w0L7D7/G+wU2P2zI="
        ];
      };

      gc = {
        automatic = true;
        dates = "weekly";
        options = "--max-freed 1G --delete-older-than 7d";
      };
    };
  };

  flake.modules.homeManager.system-minimal = {
    config,
    pkgs,
    inputs,
    ...
  }: {
    _module.args.pkgs-stable = import inputs.nixpkgs-stable {
      inherit (pkgs.stdenv.hostPlatform) system;
      config.allowUnfree = true;
    };

    home.homeDirectory = "/home/${config.home.username}";
    home.stateVersion = "26.05";
  };
}
