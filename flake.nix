{
  description = "A very basic flake";

  inputs = {
    nix-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";

    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs = { nixpkgs.follows = "nixpkgs"; };
    };
  };

  outputs = inputs@{ nix-unstable, nixpkgs, home-manager, ... }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        overlays = [
          (import ./overlays/keet-overlay.nix)
        ];
        config.allowUnfree = true;
      };
      unstable = import nix-unstable {
        inherit system;
        config.allowUnfree = true;
      };
    in
    {
      nixosConfigurations = {
        rataria = nixpkgs.lib.nixosSystem {
          inherit system;
          specialArgs = { inherit inputs unstable; };
          modules = [
            ./modules
            ./modules/gaming-specialisation.nix
            home-manager.nixosModules.home-manager
            {
              home-manager = {
                useGlobalPkgs = true;
                useUserPackages = true;
                backupFileExtension = "backup";
                extraSpecialArgs = { inherit unstable inputs; };

                users.ratoncio = import ./modules/home-manager/ratoncio {
                  inherit inputs pkgs unstable;
                  config = { };
                };
              };
            }
          ];
        };
      };
    };
}
