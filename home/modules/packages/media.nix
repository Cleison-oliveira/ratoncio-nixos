{ pkgs, ... }:
{
  home.packages = with pkgs; [
    gpu-screen-recorder-gtk
    ffmpeg-full
    pulsemixer
    pulseaudio
    feh
    easyeffects
    krita
    inkscape
    gimp3
    qpdfview
    pavucontrol
    alsa-utils
  ];
}
