let
  classes = {
    qtTools = "^(qt5ct|qt6ct)$";
    dialogs = "^(xdg-desktop-portal-gtk|polkit-gnome-authentication-agent-1|lxpolkit|polkit-kde-authentication-agent-1|org.kde.polkit-kde-authentication-agent-1|qalculate-gtk|gnome-calculator|mate-calc|copyq|clipman)$";
    telegram = "^\\.Telegram-wrapped$";
    dolphin = "^(dolphin-emu)$";
    kdenlive = "^(kdenlive|org.kde.kdenlive)$";
    thunar = "^(thunar)$";
    kvantumManager = "^(kvantummanager)$";
    anon = "^$";
  };
  titles = {
    telegramFiles = "^(Choose Files|Save Image|Save File|Open File|Select File)$";
    dolphinDialogs = "^(Open|Save|Select|.*Configuration|.*Settings|Controller|Graphics|Properties|Vulkan Graphics Configuration)(.*)$";
    dolphinSize = "^(Open|Save|Select)(.*)$";
    kdenliveProject = "^(Open Project|Save Project|Open)(.*)$";
    kdenliveRender = "^(Render|Render Project|Export|Export Project|Render File)(.*)$";
    kdenliveTools = "^(Effects|Transitions|Titler|Monitor|Clip Properties|Project Bin)(.*)$";
    thunarDialogs = "^(Rename|Replace|File Exists|Confirm)(.*)$";
    kvantumMain = "^(Kvantum Manager)$";
    kvantumDialogs = "^(Open|Save|Select)(.*)$";
  };
  mkRules = rules: builtins.concatLists (map
    (r:
      map (prop: "${prop},class:${r.class},title:${r.title}") r.props
    )
    rules);
  presets = {
    floatCenter = [ "float" "center" "stayfocused" ];
    floatCenterNoStay = [ "float" "center" ];
    portalSize = [ "size 60% 65%" "minsize 800 600" "maxsize 1400 900" ];
    standardSize = [ "size 65% 75%" "minsize 1000 700" ];
  };
in
[
  "tile,class:${classes.qtTools}"
]
++ mkRules [
  { class = classes.dialogs; title = ".*"; props = presets.floatCenter ++ presets.portalSize; }
  { class = classes.telegram; title = titles.telegramFiles; props = presets.floatCenter ++ presets.portalSize; }
  { class = classes.dolphin; title = titles.dolphinDialogs; props = presets.floatCenter; }
  { class = classes.dolphin; title = titles.dolphinSize; props = presets.standardSize; }
  { class = classes.kdenlive; title = titles.kdenliveProject; props = presets.floatCenter ++ [ "size 65% 75%" ]; }
  { class = classes.kdenlive; title = titles.kdenliveRender; props = presets.floatCenter ++ [ "size 80% 80%" "minsize 1000 700" ]; }
  { class = classes.kdenlive; title = titles.kdenliveTools; props = presets.floatCenter ++ [ "size 60% 70%" ]; }
  { class = "^(kdenlive)$"; title = "^$"; props = presets.floatCenter ++ presets.standardSize; }
  { class = classes.thunar; title = titles.thunarDialogs; props = presets.floatCenter ++ [ "size 15% 15%" "minsize 150 150" ]; }
  { class = classes.kvantumManager; title = titles.kvantumDialogs; props = presets.floatCenterNoStay ++ presets.standardSize; }
  { class = classes.anon; title = titles.kvantumMain; props = [ "tile" ]; }
  { class = classes.anon; title = ".*"; props = presets.floatCenterNoStay ++ [ "size 50% 60%" ]; }
]
