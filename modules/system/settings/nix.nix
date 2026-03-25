{
  flake-file.inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  };

  flake.modules.nixos.nix-basic = {
    nixpkgs.config = {
      allowUnfree = true;
      allowBroken = false;
    };
    programs.appimage.binfmt = true;

    nix = {
      settings.experimental-features = [
        "nix-command"
        "flakes"
      ];

      gc = {
        automatic = true;
        dates = "weekly";
        options = "--max-freed 1G --delete-older-than 7d";
      };
      optimise.automatic = true;
      settings = {
        trusted-users = ["root" "ratoncio"];
        allowed-users = ["@wheel"];
        auto-optimise-store = true;
        sandbox = true;
        substituters = [
          "https://cache.nixos.org"
          "https://cache.nixos-cuda.org"
          "https://cuda-maintainers.cachix.org"
          "https://comfyui.cachix.org"
        ];
        trusted-public-keys = [
          "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
          "comfyui.cachix.org-1:33mf9VzoIjzVbp0zwj+fT51HG0y31ZTK3nzYZAX0rec="
          "cache.nixos-cuda.org:74DUi4Ye579gUqzH4ziL9IyiJBlDpMRn9MBN8oNan9M="
          "cuda-maintainers.cachix.org-1:0dq3bujKpuEPMCX6U4WylrUDZ9JyUG0VpVZa7CNfq5E="
        ];
      };
    };
  };
}
