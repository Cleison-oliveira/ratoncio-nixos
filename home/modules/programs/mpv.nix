{ ... }:
{
  programs.mpv = {
    enable = true;
    config = {
      force-window = "yes";
      fullscreen = "no";
      osc = "yes";
      profile = "gpu-hq";
      save-position-on-quit = "yes";
      ytdl-format = "bestvideo+bestaudio";
    };
  };
}
