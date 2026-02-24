{ pkgs, ... }:
{
  home.packages = with pkgs; [
    gnutar
    unzip
    p7zip
    unrar
    zip
    gzip
    bzip2
    xz
    libarchive
    engrampa
  ];
}
