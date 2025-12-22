{ pkgs, ... }: with pkgs; {
  home = {
    packages = [
      wl-clipboard
      grim
      quickshell
      slurp
    ];
  };
}
