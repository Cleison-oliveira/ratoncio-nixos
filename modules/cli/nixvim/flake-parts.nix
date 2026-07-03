{inputs, ...}: {
  # Module to configure neovim on nixos
  # https://github.com/nix-community/nixvim

  flake-file.inputs.nixvim = {
    url = "github:nix-community/nixvim";
    inputs.nixpkgs.follows = "nixpkgs";
  };

  flake.modules.homeManager.nixvim = {
    imports = [inputs.nixvim.homeModules.nixvim];
  };
}
