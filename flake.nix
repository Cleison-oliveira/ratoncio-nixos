{
  description = "A very basic flake";

  inputs = {

    nixpkgs = {
      url = "github:nixos/nixpkgs/nixos-unstable";
    };

    noctalia = {
      url = "github:noctalia-dev/noctalia-shell";
      inputs = { nixpkgs.follows = "nixpkgs"; };
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs = { nixpkgs.follows = "nixpkgs"; };
    };
  };

  outputs = inputs@{ nixpkgs, ... }:
    {
      nixosConfigurations = {
        rataria = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs; };
          modules = [
            ./nixos
          ];
        };
      };
    };
}
