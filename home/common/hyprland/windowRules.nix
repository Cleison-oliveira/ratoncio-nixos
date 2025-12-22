let
  classes = {
    qtTools = "^(qt5ct|qt6ct)$";
    dialogs = "^(xdg-desktop-portal-gtk|polkit-gnome-authentication-agent-1|lxpolkit|polkit-kde-authentication-agent-1|org.kde.polkit-kde-authentication-agent-1|qalculate-gtk|gnome-calculator|mate-calc|copyq|clipman)$";
    fileManagers = "^(thunar|pcmanfm|nemo|caja)$";
    thunar = "^(thunar)$";
    telegram = "^\\.Telegram-wrapped$";
    discord = "^(discord|vesktop|WebCord)$";
    browsers = "^(firefox|chromium|brave|vivaldi|opera)$";
    dolphin = "^(dolphin-emu)$";
    kdenlive = "^(kdenlive|org.kde.kdenlive)$";
    gimp = "^(gimp|org.gimp.GIMP)$";
    inkscape = "^(inkscape|org.inkscape.Inkscape)$";
    blender = "^(blender|org.blender.Blender)$";
    kvantumManager = "^(kvantummanager)$";
    vscode = "^(code|Code|VSCodium)$";
    terminals = "^(kitty|alacritty|wezterm|foot)$";
    mediaPlayers = "^(mpv|vlc|celluloid)$";
    imageViewers = "^(imv|feh|sxiv|nsxiv|gwenview)$";
    anon = "^$";
  };

  titles = {
    telegramFiles = "^(Choose Files|Save Image|Save File|Open File|Select File|Save As)$";
    discordFiles = "^(Upload|Save|Download|Select Files)(.*)$";
    browserDownloads = "^(Downloads|Save|Open|Save As|File Upload)(.*)$";
    dolphinDialogs = "^(Open|Save|Select|.*Configuration|.*Settings|Controller|Graphics|Properties|Vulkan Graphics Configuration|Hotkey Settings)(.*)$";
    dolphinSize = "^(Open|Save|Select)(.*)$";
    kdenliveProject = "^(Open Project|Save Project|Open|New Project)(.*)$";
    kdenliveRender = "^(Render|Render Project|Export|Export Project|Render File|Rendering)(.*)$";
    kdenliveTools = "^(Effects|Transitions|Titler|Monitor|Clip Properties|Project Bin|Audio Spectrum|Waveform)(.*)$";
    gimpDialogs = "^(Export|Import|Open|Save|Save As|Export Image|Preferences|Filters)(.*)$";
    inkscapeDialogs = "^(Export|Import|Open|Save|Save As|Document Properties|Preferences)(.*)$";
    blenderDialogs = "^(Save|Open|Import|Export|Render|Preferences|User Preferences)(.*)$";
    thunarDialogs = "^(Rename|Replace|File Exists|Confirm|Delete|Move|Copy|Properties)(.*)$";
    fileManagerDialogs = "^(Rename|Replace|File Exists|Confirm|Delete|Move|Copy|Properties|Create|New)(.*)$";
    kvantumMain = "^(Kvantum Manager)$";
    kvantumDialogs = "^(Open|Save|Select|Install|Delete)(.*)$";
    vscodeDialogs = "^(Open|Save|Save As|Select|Preferences|Settings|Extensions)(.*)$";
    imageViewerDialogs = "^(Open|Save|Delete|Properties)(.*)$";
    mediaPlayerDialogs = "^(Open|Save|Playlist|Equalizer|Preferences)(.*)$";
  };

  mkRules = rules: builtins.concatLists (
    map (r: map (prop: "${prop},class:${r.class},title:${r.title}") r.props) rules
  );

  presets = {
    floatCenter = [ "float" "center" "stayfocused" "pin" ];
    floatCenterNoStay = [ "float" "center" "pin" ];
    floatOnWindow = [ "float" "move onwindow center" "stayfocused" "pin" ];
    tile = [ "tile" ];
    sizeSmall = [ "size 40% 50%" "minsize 600 500" "maxsize 900 700" ];
    sizeMedium = [ "size 60% 65%" "minsize 800 600" "maxsize 1400 900" ];
    sizeLarge = [ "size 65% 75%" "minsize 1000 700" "maxsize 1600 1000" ];
    sizeXLarge = [ "size 80% 80%" "minsize 1200 800" "maxsize 1800 1200" ];
    sizeDialog = [ "size 15% 15%" "minsize 150 150" "maxsize 400 400" ];
    sizeFullscreen = [ "size 100% 100%" ];
  };
in
[
  "tile,class:${classes.qtTools}"
  "tile,class:${classes.browsers}"
  "tile,class:${classes.vscode}"
  "tile,class:${classes.terminals}"
] ++ mkRules [
  { class = classes.dialogs; title = ".*"; props = presets.floatCenter ++ presets.sizeMedium; }
  { class = classes.telegram; title = titles.telegramFiles; props = presets.floatCenter ++ presets.sizeMedium; }
  { class = classes.discord; title = titles.discordFiles; props = presets.floatCenter ++ presets.sizeMedium; }
  { class = classes.browsers; title = titles.browserDownloads; props = presets.floatCenter ++ presets.sizeMedium; }
  { class = classes.dolphin; title = titles.dolphinDialogs; props = presets.floatCenter ++ presets.sizeSmall; }
  { class = classes.dolphin; title = titles.dolphinSize; props = presets.floatCenter ++ presets.sizeLarge; }
  { class = classes.kdenlive; title = titles.kdenliveProject; props = presets.floatCenter ++ presets.sizeLarge; }
  { class = classes.kdenlive; title = titles.kdenliveRender; props = presets.floatCenter ++ presets.sizeXLarge; }
  { class = classes.kdenlive; title = titles.kdenliveTools; props = presets.floatCenter ++ presets.sizeMedium; }
  { class = "^(kdenlive)$"; title = "^$"; props = presets.floatCenter ++ presets.sizeLarge; }
  { class = classes.gimp; title = titles.gimpDialogs; props = presets.floatCenter ++ presets.sizeLarge; }
  { class = classes.inkscape; title = titles.inkscapeDialogs; props = presets.floatCenter ++ presets.sizeLarge; }
  { class = classes.blender; title = titles.blenderDialogs; props = presets.floatCenter ++ presets.sizeLarge; }
  { class = classes.fileManagers; title = titles.fileManagerDialogs; props = presets.floatCenter ++ presets.sizeDialog; }
  { class = classes.thunar; title = titles.thunarDialogs; props = presets.floatOnWindow ++ presets.sizeDialog; }
  { class = classes.vscode; title = titles.vscodeDialogs; props = presets.floatCenter ++ presets.sizeMedium; }
  { class = classes.imageViewers; title = titles.imageViewerDialogs; props = presets.floatCenter ++ presets.sizeSmall; }
  { class = classes.mediaPlayers; title = titles.mediaPlayerDialogs; props = presets.floatCenter ++ presets.sizeMedium; }
  { class = classes.kvantumManager; title = titles.kvantumDialogs; props = presets.floatCenterNoStay ++ presets.sizeLarge; }
  { class = classes.anon; title = titles.kvantumMain; props = presets.tile; }
  { class = classes.anon; title = ".*"; props = presets.floatCenterNoStay ++ [ "size 50% 60%" "minsize 700 500" ]; }
]
