{ pkgs, ... }: {
  environment = {
    systemPackages = with pkgs; [
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
      glib
      apparmor-utils
    ];
  };
}
