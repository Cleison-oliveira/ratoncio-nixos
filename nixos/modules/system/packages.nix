{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    tree
    busybox
    appimage-run
    glib
    apparmor-utils
    ddcutil
    tuigreet
    cudaPackages.cudatoolkit
    cudaPackages.cudnn
    alsa-utils
  ];
}
