{ pkgs, ... }: with pkgs; {
  home = {
    packages = [
      gpu-screen-recorder-gtk
      kdePackages.kdenlive
      ffmpeg-full
      pulsemixer
      pulseaudio
    ];
  };
}
