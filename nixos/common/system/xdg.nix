{ pkgs, ... }:
with pkgs; {
  xdg = {
    portal = {
      enable = true;
      extraPortals = [
        xdg-desktop-portal-gtk
        xdg-desktop-portal-hyprland
      ];
      config = {
        common = {
          default = [ "hyprland" "gtk" ];
        };
      };
    };
  };
}
