{ config, pkgs, ... }: {
  services.picom.enable = true;

  environment.etc."xdg/picom/picom.conf".text = ''
    backend = "glx";

    round-borders = 1;
    rounded-corners-exclude = [
        "window_type = 'dock'",
        "window_type = 'normal'",
        "class_g = '64Gram'",
    ];

    glx-no-stencil = true;
    glx-copy-from-front = false;
    glx-no-rebind-pixmap = true;

    use-damage = false;
    shadow = false;
    shadow-radius = 35;
    shadow-offset-x = -35;
    shadow-offset-y = -35;
    shadow-opacity = 0.8;

    shadow-exclude = [
        "name = 'Notification'",
        "name = 'Plank'",
        "name = 'Docky'",
        "name = 'Kupfer'",
        "name = 'Pensela'",
        "name = 'Drawing Board'",
        "name = 'VirtualBox'",
        "name = 'VirtualBoxVM'",
        "name = 'Negatron v0.100.1' && argb",
        "name ?= 'xfwm4' && argb",
        "class_g = 'Conky'",
        "class_g = 'Kupfer'",
        "class_g = 'Synapse'",
        "class_g ?= 'Notify-osd'",
        "class_g ?= 'Cairo-dock'",
        "class_g = 'Cairo-clock'",
        "class_g ?= 'Xfce4-notifyd'",
        "class_g = 'Thunderbird' && argb",
        "class_g = 'Telegram' && argb",
        "name ?= 'Thunderbird' && (window_type = 'utility' || window_type = 'popup_menu')",
        "class_g ?= 'Thunderbird' && class_i = 'Popup' && argb",
        "class_g = 'firefox' && (window_type = 'utility' || window_type = 'popup_menu') && argb",
        "class_g = 'Firefox' && (window_type = 'utility' || window_type = 'popup_menu') && argb",
        "class_g = 'firefox-esr' && (window_type = 'utility' || window_type = 'popup_menu') && argb",
        "class_g = 'Firefox-esr' && (window_type = 'utility' || window_type = 'popup_menu') && argb",
        "class_g = 'Tor Browser' && (window_type = 'utility') && argb",
        "class_g = 'Navegador Tor' && (window_type = 'utility' || window_type = 'popup_menu') && argb",
        "class_g = 'Thunderbird' && (window_type = 'utility' || window_type = 'popup_menu') && argb",
        "class_g = 'Mozilla Thunderbird' && (window_type = 'utility' || window_type = 'popup_menu') && argb",
        "class_g ?= 'Xfce4-power-manager'",
        "class_g ?= 'vokoscreen' && argb",
        "name = 'Área'",
        "name *= 'Cuenta regresiva'",
    ];

    shadow-ignore-shaped = false;

    inactive-opacity = 1;
    active-opacity = 1;
    frame-opacity = 1;
    inactive-opacity-override = true;

    blur-background = false;

    blur-background-exclude = [
        "class_g = 'Peek'",
        "class_g = 'Pensela'",
        "name = 'Drawing Board'",
        "window_type = 'dock'",
        "window_type = 'dropdown_menu'",
        "window_type = 'combo'",
        "window_type = 'popup_menu'",
        "window_type = 'utility'",
        "window_type = 'desktop'",
        # "_GTK_FRAME_EXTENTS@:c"
    ];

    opacity-exclude = [
        "name = 'Stratagus'"
    ];

    fading = false;
    fade-in-step = 0.07;
    fade-out-step = 0.07;
    fade-exclude = [ ];

    log-level = "warn";

    mark-wmwin-focused = true;
    mark-ovredir-focused = true;
    # use-ewmh-active-win = true;
    detect-rounded-corners = true;
    detect-client-opacity = true;
    refresh-rate = 144;

    focus-exclude = [ "class_g = 'Cairo-clock'" ];

    detect-transient = true;
    detect-client-leader = true;
    invert-color-include = [ ];

    resize-damage = 2;

    wintypes: {
        dock = { shadow = false; };
        dnd = { shadow = false; };
        popup_menu = { opacity = 1; };
        dropdown_menu = { opacity = 1; };
    };
  '';

  services.xserver.windowManager.i3.extraSessionCommands = ''
    ${pkgs.picom}/bin/picom --config /etc/xdg/picom/picom.conf --experimental-backends &
  '';
}
