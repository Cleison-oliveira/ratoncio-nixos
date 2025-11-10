{
  description = "A very basic flake";

  inputs = {
    nix-unstable = {
      url = "github:nixos/nixpkgs/nixos-unstable";
    };
    catppuccin = {
      url = "github:catppuccin/nix/release-25.05";
    };
    nixpkgs = {
      url = "github:nixos/nixpkgs/nixos-25.05";
    };
    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs = { nixpkgs.follows = "nixpkgs"; };
    };
  };

  outputs = inputs@{ nix-unstable, nixpkgs, ... }:

    let
      system = "x86_64-linux";

      unstable = import nix-unstable {
        inherit system;
        config = {
          allowUnfree = true;
        };
      };
    in

    {
      nixosConfigurations = {
        rataria = nixpkgs.lib.nixosSystem {
          inherit system;
          specialArgs = { inherit inputs unstable; };
          modules = [
            ./nixos
          ];
        };
      };
    };
}
