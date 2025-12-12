{

  modules-left = [
    "custom/niri-workspaces"
  ];

  modules-center = [
    "wrl/window"
  ];

  modules-right = [
    "cpu"
    "pulseaudio"
    "disk"
    "memory"
    "clock"
    "tray"
  ];

  tray = {
    icon-size = 16;
    spacing = 5;
  };

  clock = {
    format = "󰃰  {:%a, %b, %d - %H:%M}";
    tooltip-format = ''
      <big>{:%Y %B}</big>
      <tt><small>{calendar}</small></tt>'';
    };

    cpu = {
      format = "   {usage}%";
      tooltip = false;
      on-click = "xfce4-terminal -e htop";
    };

    disk = {
      path = "/";
      interval = 30;
      format = " / {free}";
      on-click = "thunar";
    };

    memory = {
      format = "  {}%";
      on-click = "xfce4-terminal -e htop";
    };

    pulseaudio = {
      scroll-step = 5;
      format = "󰕾  {volume}%";
      format-muted = "󰝟  0%";
      on-click = "xfce4-terminal -e pulsemixer";
    };

    "custom/niri-workspaces" = {
    exec = "~/.config/waybar/scripts/niri-workspaces.sh";
    interval = 1;
    format = "{}";
    };

    "hyprland/workspaces" = {
      disable-scroll = true;
      warp-on-scroll = false;
      format = "{icon}";
      format-icons = {
        "1" = "";
        "2" = "";
        "3" = "";
        "4" = "󰈙";
        "5" = "󰋩";
        "6" = "";
        "7" = "";
        "8" = "";
        "9" = "";
        "10" = "";
      };
    };
  }

