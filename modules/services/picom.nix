{ config, pkgs, ... }: {

  services = {
    picom = {
      enable = true;
    };
  };

  environment.etc."xdg/picom/picom.conf".text = ''
    backend = "glx";

    glx-no-stencil = true;
    glx-copy-from-front = false;
    glx-no-rebind-pixmap = true;

    use-damage = false;
    shadow = false;

    inactive-opacity = 1;
    active-opacity = 1;
    frame-opacity = 1;
    inactive-opacity-override = true;

    blur-background = false;

    opacity-exclude = [
      "name = 'Stratagus'"
    ];

    fading = false;

    log-level = "warn";

    mark-wmwin-focused = true;
    mark-ovredir-focused = true;
    detect-rounded-corners = true;
    detect-client-opacity = true;

    focus-exclude = [ "class_g = 'Cairo-clock'" ];

    detect-transient = true;
    detect-client-leader = true;

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
