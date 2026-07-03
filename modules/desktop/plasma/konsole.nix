{...}: {
  flake.modules.homeManager.desktop-plasma = {
    config,
    pkgs,
    ...
  }: let
    breezeDarkErgo = pkgs.writeTextFile {
      name = "breeze-dark-ergo.colorscheme";
      text = ''
        [Background]
        Color=35,38,39
        [BackgroundFaint]
        Color=35,38,39
        [BackgroundIntense]
        Color=35,38,39
        [Foreground]
        Color=240,243,245
        [ForegroundFaint]
        Color=122,124,125
        [ForegroundIntense]
        Color=249,250,251
        [Color0]
        Color=49,54,59
        [Color0Faint]
        Color=49,54,59
        [Color0Intense]
        Color=127,131,135
        [Color1]
        Color=232,90,102
        [Color1Faint]
        Color=232,90,102
        [Color1Intense]
        Color=240,120,130
        [Color2]
        Color=107,196,123
        [Color2Faint]
        Color=107,196,123
        [Color2Intense]
        Color=130,210,140
        [Color3]
        Color=242,197,95
        [Color3Faint]
        Color=242,197,95
        [Color3Intense]
        Color=249,213,148
        [Color4]
        Color=97,175,239
        [Color4Faint]
        Color=97,175,239
        [Color4Intense]
        Color=120,190,245
        [Color5]
        Color=198,120,221
        [Color5Faint]
        Color=198,120,221
        [Color5Intense]
        Color=210,140,230
        [Color6]
        Color=86,182,194
        [Color6Faint]
        Color=86,182,194
        [Color6Intense]
        Color=110,200,210
        [Color7]
        Color=240,243,245
        [Color7Faint]
        Color=240,243,245
        [Color7Intense]
        Color=249,250,251
        [General]
        Description=Breeze Dark Ergo
        Opacity=1
        Wallpaper=
      '';
    };
  in {
    programs.konsole = {
      enable = true;
      defaultProfile = config.home.username;
      profiles."${config.home.username}" = {
        colorScheme = "Breeze-Dark-Ergo";
        font = {
          name = "Hack";
          size = 11;
        };

        extraConfig = {
          Scrolling = {
            HistorySize = 100000;
            ScrollFullPage = 1;
            HighlightScrolledLines = false;
          };
          General = {
            AlternatingBackground = 0;
            AlternatingBars = 0;
            ErrorBackground = 2;
            ErrorBars = 2;
            SemanticHints = 0;
            SemanticInputClick = false;
            SemanticUpDown = false;
            ShowTerminalSizeHint = false;
          };
        };
      };
    };
    xdg.dataFile."konsole/Breeze-Dark-Ergo.colorscheme".source = breezeDarkErgo;
  };
}
