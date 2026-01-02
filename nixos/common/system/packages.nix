{ pkgs, ... }: {
  environment = {
    systemPackages = with pkgs; [
      wget
      curl
      tree
      busybox
      gcc
      gnumake
      fd
      appimage-run
      glib
      apparmor-utils
      ddcutil
      cudaPackages.cudatoolkit
      cudaPackages.cudnn
    ];
  };
}
