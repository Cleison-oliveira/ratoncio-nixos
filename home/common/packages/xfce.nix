{ pkgs, ... }: with pkgs; {
  home = {
    packages = with xfce; [
      ristretto
    ];
  };
}
