# Manage KDE Plasma with Home Manager
# https://github.com/nix-community/plasma-manager
{inputs, ...}: {
  flake-file.inputs.plasma-manager = {
    url = "github:nix-community/plasma-manager";
    inputs.nixpkgs.follows = "nixpkgs";
    inputs.home-manager.follows = "home-manager";
  };

  flake.modules.homeManager.plasma-manager = {
    imports = [
      inputs.plasma-manager.homeModules.plasma-manager
    ];
  };
}
