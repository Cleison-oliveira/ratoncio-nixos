{inputs, ...}: {
  flake-file.inputs.delphis = {
    url = "github:Cleison-oliveira/Delphis";
    inputs.nixpkgs.follows = "nixpkgs";
  };

  flake.modules.homeManager.desktop-delphis = {
    pkgs,
    ...
  }: {
    imports = [
      inputs.delphis.homeManagerModules.default
    ];

    programs.delphis = {
      enable = true;
      package = inputs.delphis.packages.${pkgs.stdenv.hostPlatform.system}.default;
    };

    home.packages = [
      inputs.delphis.packages.${pkgs.stdenv.hostPlatform.system}.dte
    ];
  };

  flake.modules.nixos.desktop-delphis = {
    pkgs,
    ...
  }: {
    imports = [
      inputs.delphis.nixosModules.default
    ];

    programs.delphis = {
      enable = true;
      package = inputs.delphis.packages.${pkgs.stdenv.hostPlatform.system}.default;
    };

    environment.systemPackages = [
      inputs.delphis.packages.${pkgs.stdenv.hostPlatform.system}.dte
    ];
  };
}
