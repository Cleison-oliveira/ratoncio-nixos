{ pkgs, ... }: with pkgs; {
  home = {
    packages = [
      lua5_1
      R
      (python3.withPackages (ps: with ps; [ pynvim ]))
      luarocks-nix
      tree-sitter
      lua-language-server
    ];
  };
}
