{
  flake.modules.homeManager.cli-programming = {pkgs, ...}: {
    home.packages = with pkgs; [
      gcc
      gnumake
      alejandra
      nixpkgs-fmt
      lua51Packages.jsregexp
      lua5_1
      luarocks-nix
      (python311.withPackages (ps:
        with ps; [
          pynvim
        ]))
      R
      clang-tools
      lua-language-server
      nixd
      tree-sitter
      ripgrep
      eza
    ];
  };
}
