{
  description = "A very basic flake";

  inputs = {

    nix-unstable = {
      url = "github:nixos/nixpkgs/nixos-unstable";

    };

    noctalia = {
      url = "github:noctalia-dev/noctalia-shell";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixpkgs = {
      url = "github:nixos/nixpkgs/nixos-25.11";
    };

    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
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
