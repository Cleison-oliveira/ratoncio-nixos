{ pkgs, lib, config, ... }:

{
  home.packages = with pkgs; [
    rofi
    i3blocks
    i3status-rust
    xclip
    xsel
    maim
    i3lock
    python3Packages.i3ipc
    autotiling
    xdotool
    picom
    feh
  ];

  home.file = {
    ".xinitrc".source = config.home.file.".xsession".source;
    ".xinitrc".executable = true;
  };

  xsession = {
    enable = true;
    windowManager = {
      i3 = {
        enable = true;
        config =
          let
            mod = "Mod4";
            exec = "exec --no-startup-id";
            home = config.home.homeDirectory;
            
            shotsDir = "${home}/Pictures/Screenshots";
            timestamp = "$(date +%Y-%m-%d_%H-%M-%S).png";
            
            maim = "${pkgs.maim}/bin/maim";
            xclip = "${pkgs.xclip}/bin/xclip";
            xdotool = "${pkgs.xdotool}/bin/xdotool";
            rofi = "${pkgs.rofi}/bin/rofi";
            term = "${pkgs.xfce4-terminal}/bin/xfce4-terminal";
            i3lock = "${pkgs.i3lock}/bin/i3lock";
            i3status = "${pkgs.i3status-rust}/bin/i3status-rs";
            dbus = "${pkgs.dbus}/bin/dbus-run-session";
            killall = "${pkgs.psmisc}/bin/killall";
          in
          {
            modifier = mod;
            workspaceOutputAssign = [
              { workspace = "1"; output = "DisplayPort-3"; }
              { workspace = "2"; output = "DisplayPort-4"; }
            ];

            fonts = {
              names = [ "AdwaitaMonoNerdFont" ];
              size = 10.0;
            };

            gaps = {
              inner = 6;
              outer = 6;
            };

            window = {
              border = 1;
              titlebar = false;
            };

            defaultWorkspace = "workspace number 1";

            focus = {
              followMouse = true;
              mouseWarping = true;
            };

            floating = {
              modifier = mod;
              border = 1;
            };

            colors = {
              focused = {
                border = "#89b4fa";
                background = "#89b4fa";
                text = "#282a36";
                indicator = "#89b4fa";
                childBorder = "#89b4fa";
              };
              focusedInactive = {
                border = "#44475A";
                background = "#44475A";
                text = "#f8f8f2";
                indicator = "#44475A";
                childBorder = "#44475A";
              };
              unfocused = {
                border = "#282A36";
                background = "#282A36";
                text = "#BFBFBF";
                indicator = "#282A36";
                childBorder = "#282A36";
              };
              urgent = {
                border = "#44475A";
                background = "#FF5555";
                text = "#F8F8F2";
                indicator = "#FF5555";
                childBorder = "#f38ba8";
              };
              placeholder = {
                border = "#282A36";
                background = "#282A36";
                text = "#F8F8F2";
                indicator = "#282A36";
                childBorder = "#282A36";
              };
              background = "#F8F8F2";
            };

            bars = [
              {
                position = "top";
                statusCommand = "${i3status} ~/.config/i3status-rust/config.toml";
                trayOutput = "none";
                workspaceButtons = true;

                fonts = {
                  names = [ "AdwaitaMonoNerdFont" ];
                  size = 10.0;
                };

                colors = {
                  background = "#1d1d2d";
                  statusline = "#ffffff";
                  separator = "#1d1d2d";

                  focusedWorkspace = {
                    border = "#89b4fa";
                    background = "#89b4fa";
                    text = "#1d1d2d";
                  };
                  activeWorkspace = {
                    border = "#313244";
                    background = "#313244";
                    text = "#89b4fa";
                  };
                  inactiveWorkspace = {
                    border = "#313244";
                    background = "#313244";
                    text = "#89b4fa";
                  };
                  urgentWorkspace = {
                    border = "#f38ba8";
                    background = "#f38ba8";
                    text = "#1d1d2d";
                  };
                };

                extraConfig = ''
                  workspace_min_width 30
                  strip_workspace_numbers yes
                  bindsym button4 nop
                  bindsym button5 nop
                  height 25
                '';
              }
            ];

            keybindings = lib.mkOptionDefault {
              "${mod}+q" = "kill";
              "${mod}+Return" = "${exec} ${term}";
              "${mod}+d" = "${exec} ${rofi} -show drun";
              "${mod}+h" = "split h";
              "${mod}+v" = "split v";
              "${mod}+f" = "fullscreen toggle";
              "${mod}+w" = "layout tabbed";
              "${mod}+e" = "layout toggle split";
              "${mod}+Shift+space" = "floating toggle";
              "${mod}+space" = "focus mode_toggle";
              "${mod}+a" = "focus parent";

              "${mod}+Left" = "focus left";
              "${mod}+Down" = "focus down";
              "${mod}+Up" = "focus up";
              "${mod}+Right" = "focus right";

              "${mod}+Shift+Left" = "move left";
              "${mod}+Shift+Down" = "move down";
              "${mod}+Shift+Up" = "move up";
              "${mod}+Shift+Right" = "move right";

              "${mod}+1" = "workspace number 1";
              "${mod}+2" = "workspace number 2";
              "${mod}+3" = "workspace number 3";
              "${mod}+4" = "workspace number 4";
              "${mod}+5" = "workspace number 5";
              "${mod}+6" = "workspace number 6";
              "${mod}+7" = "workspace number 7";
              "${mod}+8" = "workspace number 8";
              "${mod}+9" = "workspace number 9";
              "${mod}+0" = "workspace number 10";

              "${mod}+Shift+1" = "move container to workspace number 1";
              "${mod}+Shift+2" = "move container to workspace number 2";
              "${mod}+Shift+3" = "move container to workspace number 3";
              "${mod}+Shift+4" = "move container to workspace number 4";
              "${mod}+Shift+5" = "move container to workspace number 5";
              "${mod}+Shift+6" = "move container to workspace number 6";
              "${mod}+Shift+7" = "move container to workspace number 7";
              "${mod}+Shift+8" = "move container to workspace number 8";
              "${mod}+Shift+9" = "move container to workspace number 9";
              "${mod}+Shift+0" = "move container to workspace number 10";

              "${mod}+Shift+t" = "${exec} firejail --profile=${home}/.firejail/telegram.profile ${pkgs.telegram-desktop}/bin/Telegram";
              "${mod}+Shift+b" = "${exec} firejail --profile=${home}/.firejail/base.profile google-chrome-stable";
              "${mod}+Shift+f" = "${exec} ${dbus} thunar";
              "${mod}+Shift+d" = "${exec} ${pkgs.discord}/bin/discord";
              "${mod}+Shift+s" = "${exec} steam";
              "${mod}+Shift+g" = "${exec} ${pkgs.gimp}/bin/gimp";
              "${mod}+Shift+i" = "${exec} ${pkgs.inkscape}/bin/inkscape";
              "${mod}+Shift+k" = "${exec} keet";

              "${mod}+Ctrl+s" = "${exec} killall steam";
              "${mod}+Ctrl+d" = "${exec} killall discord";
              "${mod}+Ctrl+t" = "${exec} killall Telegram";
              "${mod}+Ctrl+k" = "${exec} ${pkgs.procps}/bin/pkill -9 pear-runtime";

              "${mod}+Shift+m" = "${exec} pactl set-sink-mute @DEFAULT_SINK@ toggle";
              "${mod}+Shift+Prior" = "${exec} pactl set-sink-volume @DEFAULT_SINK@ +5%";
              "${mod}+Shift+Next" = "${exec} pactl set-sink-volume @DEFAULT_SINK@ -5%";
              "${mod}+Shift+p" = "${exec} i3-sensible-terminal -e ${pkgs.pulsemixer}/bin/pulsemixer";

              "XF86AudioRaiseVolume" = "${exec} pactl set-sink-volume @DEFAULT_SINK@ +5% && ${killall} -SIGUSR1 i3status-rs";
              "XF86AudioLowerVolume" = "${exec} pactl set-sink-volume @DEFAULT_SINK@ -5% && ${killall} -SIGUSR1 i3status-rs";
              "XF86AudioMute" = "${exec} pactl set-sink-mute @DEFAULT_SINK@ toggle && ${killall} -SIGUSR1 i3status-rs";
              "XF86AudioMicMute" = "${exec} pactl set-source-mute @DEFAULT_SOURCE@ toggle && ${killall} -SIGUSR1 i3status-rs";

              "Ctrl+F12" = "${exec} ${maim} | ${xclip} -selection clipboard -t image/png";
              "Ctrl+Shift+F12" = "${exec} ${maim} \"${shotsDir}/${timestamp}\"";
              "${mod}+F12" = "${exec} ${maim} --select | ${xclip} -selection clipboard -t image/png";
              "Shift+F12" = "${exec} ${maim} --select \"${shotsDir}/${timestamp}\"";
              "Ctrl+${mod}+F12" = "${exec} ${maim} --window $(${xdotool} getactivewindow) | ${xclip} -selection clipboard -t image/png";
              "${mod}+Shift+F12" = "${exec} ${maim} --window $(${xdotool} getactivewindow) \"${shotsDir}/${timestamp}\"";

              "${mod}+Ctrl+Shift+l" = "${exec} ${i3lock} -c 1e1e2e";
              "${mod}+Shift+c" = "reload";
              "${mod}+Shift+r" = "restart";
              "${mod}+Shift+e" = ''exec "i3-nagbar -t warning -m 'Do you really want to exit i3?' -B 'Yes' 'i3-msg exit'"'';
              "${mod}+r" = "mode \"resize\"";
            };

            modes.resize = {
              "j" = "resize shrink width 10 px or 10 ppt";
              "k" = "resize grow height 10 px or 10 ppt";
              "l" = "resize shrink height 10 px or 10 ppt";
              "ccedilla" = "resize grow width 10 px or 10 ppt";
              "Left" = "resize shrink width 10 px or 10 ppt";
              "Down" = "resize grow height 10 px or 10 ppt";
              "Up" = "resize shrink height 10 px or 10 ppt";
              "Right" = "resize grow width 10 px or 10 ppt";
              "Return" = "mode default";
              "Escape" = "mode default";
              "${mod}+r" = "mode default";
            };

            assigns = {
              "1" = [ { class = "^librewolf$"; } { class = "^Chromium-browser$"; } ];
              "2" = [
                { class = "^TelegramDesktop$"; }
                { class = "^pear-runtime$"; }
                { class = "^forkgram$"; }
                { class = "^discord$"; }
              ];
              "3" = [ { class = "^VSCodium$"; } ];
              "4" = [ { class = "^org.kde.okular$"; } ];
              "5" = [
                { class = "^Gimp$"; }
                { class = "^krita$"; }
                { class = "^Inkscape$"; }
              ];
              "6" = [ { class = "^kdenlive$"; } ];
              "8" = [
                { class = "^steamwebhelper$"; }
                { class = "^steam$"; }
                { class = "^heroic$"; }
              ];
              "9" = [ { class = "^steam_app_0$"; } ];
            };

            startup = [
              {
                command = "${pkgs.autotiling}/bin/autotiling";
                always = true;
                notification = false;
              }
              {
                # Comando longo quebrado com string multilinha
                command = ''
                  ${pkgs.xrandr}/bin/xrandr \
                    --output DisplayPort-3 --mode 1920x1080 --rate 144 --pos 0x0 \
                    --output DisplayPort-4 --mode 1920x1080 --rate 144 --pos 1920x0
                '';
                always = true;
                notification = false;
              }
              {
                command = "${pkgs.feh}/bin/feh --bg-scale ${home}/.config/wallpaper.svg";
                notification = false;
              }
              {
                command = "${pkgs.picom}/bin/picom -b";
                always = true;
                notification = false;
              }
            ];
          };

        extraConfig = ''
          tiling_drag modifier titlebar
          for_window [class="^.*"] border pixel 2
          title_align center
        '';
      };
    };
  };
}
