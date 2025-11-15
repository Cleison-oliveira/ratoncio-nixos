[
  # Applications
  "$mainMod SHIFT,T,exec,$telegram"
  "$mainMod SHIFT,B,exec,$chromium"
  "$mainMod SHIFT,D,exec,$discord"
  "$mainMod SHIFT,S,exec,steam"
  "$mainMod SHIFT,K,exec,$keet"
  "$mainMod SHIFT,G,exec,gimp"
  "$mainMod SHIFT,I,exec,inkscape"

  # Kill applications
  "$mainMod CTRL,S,exec,killall steam"
  "$mainMod CTRL,D,exec,killall discord"
  "$mainMod CTRL,T,exec,killall telegram-desktop"
  "$mainMod CTRL,K,exec,pkill -3 pear-runtime"

  # Window management
  "$mainMod,Return,exec,$terminal"
  "$mainMod,Q,killactive"
  "$mainMod SHIFT,E,exit"
  "$mainMod SHIFT,F,exec,$fileManager"
  "$mainMod,D,exec,$menu"
  "$mainMod,W,pseudo"
  "$mainMod,F,fullscreen"
  "$mainMod,E,togglesplit"

  # Focus movement
  "$mainMod,left,movefocus,l"
  "$mainMod,right,movefocus,r"
  "$mainMod,up,movefocus,u"
  "$mainMod,down,movefocus,d"

  # Move windows
  "$mainMod SHIFT,left,movewindow,l"
  "$mainMod SHIFT,right,movewindow,r"
  "$mainMod SHIFT,up,movewindow,u"
  "$mainMod SHIFT,down,movewindow,d"

  # Workspaces
  "$mainMod,1,workspace,1"
  "$mainMod,2,workspace,2"
  "$mainMod,3,workspace,3"
  "$mainMod,4,workspace,4"
  "$mainMod,5,workspace,5"
  "$mainMod,6,workspace,6"
  "$mainMod,7,workspace,7"
  "$mainMod,8,workspace,8"
  "$mainMod,9,workspace,9"
  "$mainMod,0,workspace,10"

  # Move to workspace
  "$mainMod SHIFT,1,movetoworkspace,1"
  "$mainMod SHIFT,2,movetoworkspace,2"
  "$mainMod SHIFT,3,movetoworkspace,3"
  "$mainMod SHIFT,4,movetoworkspace,4"
  "$mainMod SHIFT,5,movetoworkspace,5"
  "$mainMod SHIFT,6,movetoworkspace,6"
  "$mainMod SHIFT,7,movetoworkspace,7"
  "$mainMod SHIFT,8,movetoworkspace,8"
  "$mainMod SHIFT,9,movetoworkspace,9"
  "$mainMod SHIFT,0,movetoworkspace,10"

  # Scroll workspaces
  "$mainMod,mouse_down,workspace,e+1"
  "$mainMod,mouse_up,workspace,e-1"

  # Audio controls
  "$mainMod SHIFT,M,exec,pactl set-sink-mute @DEFAULT_SINK@ toggle"
  "$mainMod SHIFT,Prior,exec,pactl set-sink-volume @DEFAULT_SINK@ +5%"
  "$mainMod SHIFT,Next,exec,pactl set-sink-volume @DEFAULT_SINK@ -5%"
  "$mainMod SHIFT,P,exec,xfce4-terminal -e pulsemixer"

  # Screenshot

  "CTRL, F12, exec, grim - | wl-copy"
  "CTRL_SHIFT, F12, exec, grim $imgPath"
  "SUPER, F12, exec, grim -g \"$(slurp)\" - | wl-copy"
  "SHIFT, F12, exec, grim -g \"$(slurp)\" $imgPath"
]
