{ pkgs, ... }: with pkgs; {
  home = {
    packages = [
      gnutar
      unzip
      p7zip
      unrar
      zip
      gzip
      bzip2
      xz
      libarchive
      mate.engrampa
    ];
  };
}
