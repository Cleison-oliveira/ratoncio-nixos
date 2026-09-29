{
  flake.modules.homeManager.desktop-yt-dlp = {pkgs, ...}: {
    programs.yt-dlp = {
      enable = true;
      settings = {
        downloader = "aria2c";
        downloader-args = "aria2c:'-c -x8 -s8 -k1M'";
        output = "~/Videos/%(title)s.%(ext)s";
      };
    };
    home.packages = [
      pkgs.aria2
    ];
  };
}
