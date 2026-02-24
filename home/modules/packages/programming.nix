{ pkgs, ... }:
{
  home.packages = with pkgs; [
    lua5_1
    R
    (python311.withPackages (ps: with ps; [ pynvim ]))
    luarocks-nix
    tree-sitter
    lua-language-server
    gcc
    gnumake
    vscodium
  ];
}
