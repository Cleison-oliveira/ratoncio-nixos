{ pkgs, ... }: {

  nixpkgs = {
    config = {
      allowUnfree = true;
    };
  };

  environment = {
    systemPackages = with pkgs; [
      # Essentials / CLI tools
      wget
      curl
      tree
      fzf
      busybox
      gcc
      gnumake
      ripgrep
      fd
      htop
      appimage-run

      # Archive & Compression tools
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

      # Programming languages & Dev tools
      lua5_1
      R
      (python3.withPackages (ps: with ps; [ pynvim ]))
      luarocks-nix
      tree-sitter
      lua-language-server

      # Multimedia
      ffmpeg-full
      yt-dlp
      mpv

      # Audio tools
      pulsemixer
      pulseaudio

      # System integration utilities
      glib
      xdg-utils
      xdg-user-dirs
      dconf
      apparmor-utils
    ];
  };
}
