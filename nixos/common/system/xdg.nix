{ pkgs, ... }:
with pkgs; {
  xdg = {
    portal = {
      enable = true;
      extraPortals = [ xdg-desktop-portal-gtk ];
      config = {
        common = {
          default = [ "gtk" ];
        };
      };
    };
  };
}
