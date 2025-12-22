{ pkgs, ... }: with pkgs; {
  wayland = {
    windowManager = {
      hyprland = {
        enable = true;

        portalPackage = xdg-desktop-portal-hyprland;

        xwayland = {
          enable = true;
        };

        settings = {
          "$mainMod" = "SUPER";
          "$terminal" = "foot";
          "$fileManager" = "thunar";
          "$menu" = "qs -c noctalia-shell ipc call launcher toggle";
          "$firegram" = "firejail --profile=$HOME/.firejail/telegram.profile";
          "$firebase" = "firejail --profile=$HOME/.firejail/base.profile";

          "$telegram" = "$firegram Telegram";
          "$chromium" = "$firebase chromium %U";
          "$discord" = "ELECTRON_OZONE_PLATFORM_HINT=wayland $firebase discord";
          "$keet" = "ELECTRON_OZONE_PLATFORM_HINT=wayland $firebase keet";
          "$imgPath" = "~/Pictures/Screenshots/$(date '+%Y-%m-%d_%H-%M-%S').png";

          env = [
            "XCURSOR_SIZE,24"
            "HYPRCURSOR_SIZE,24"
          ];

          exec-once = [
            "hyprpaper &"
            "noctalia-shell"
            "thunar --daemon"
          ];

          monitor = [
            "DP-2,1920x1080@144,0x0,1"
            "DP-3,1920x1080@144,1920x0,1"
          ];

          general = {
            "col.active_border" = "0xff89b4fa";
            "col.inactive_border" = "0xff313244";
            gaps_in = 6;
            gaps_out = 6;
            border_size = 2;
            resize_on_border = true;
            allow_tearing = false;
            layout = "dwindle";
          };

          decoration = {
            rounding = 8;
            rounding_power = 6;
            active_opacity = 1.0;
            inactive_opacity = 1.0;

            shadow = {
              enabled = true;
              range = 4;
              render_power = 3;
              color = "rgba(1a1a1aee)";
            };

            blur = {
              enabled = true;
              size = 3;
              passes = 1;
              vibrancy = 0.1696;
            };
          };

          xwayland = {
            force_zero_scaling = true;
          };

          input = {
            kb_layout = "us";
            kb_options = "compose:ralt";
            follow_mouse = 1;
            sensitivity = 0;

            touchpad = {
              natural_scroll = false;
            };
          };

          device = {
            name = "epic-mouse-v1";
            sensitivity = -0.5;
          };

          animations = import ./animations.nix;

          dwindle = {
            pseudotile = true;
            preserve_split = true;
          };

          master = {
            new_status = "master";
          };

          bind = import ./binds.nix;

          bindel = [
            ",XF86AudioRaiseVolume,exec,wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"
            ",XF86AudioLowerVolume,exec,wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
            ",XF86AudioMute,exec,wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
            ",XF86AudioMicMute,exec,wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
            ",XF86MonBrightnessUp,exec,brightnessctl -e4 -n2 set 5%+"
            ",XF86MonBrightnessDown,exec,brightnessctl -e4 -n2 set 5%-"
          ];

          bindl = [
            ",XF86AudioNext,exec,playerctl next"
            ",XF86AudioPause,exec,playerctl play-pause"
            ",XF86AudioPlay,exec,playerctl play-pause"
            ",XF86AudioPrev,exec,playerctl previous"
          ];

          bindm = [
            "$mainMod,mouse:272,movewindow"
            "$mainMod,mouse:273,resizewindow"
          ];

          windowrule = [
            "suppressevent maximize,class:.*"
            "nofocus,class:^$,title:^$,xwayland:1,floating:1,fullscreen:0,pinned:0"
          ];

          windowrulev2 = import ./workspaces.nix ++ import ./windowRules.nix;
        };
      };
    };
  };
}
