{ pkgs, ... }: with pkgs; {
  home = {
    packages = [
      gpu-screen-recorder-gtk
      ffmpeg-full
      pulsemixer
      pulseaudio
    ];
  };
}
