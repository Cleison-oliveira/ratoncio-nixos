{ pkgs, ... }: with pkgs; {
  home = {
    packages = [
      nixd
      nixfmt-rfc-style
      nixpkgs-fmt
    ];
  };
}
