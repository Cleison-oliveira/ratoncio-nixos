{ pkgs, ... }: with pkgs; {
  home = {
    packages = [
      wl-clipboard
      grim
      slurp
    ];
  };
}
