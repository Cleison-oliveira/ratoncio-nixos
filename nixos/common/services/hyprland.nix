{ pkgs, ... }: with pkgs; {
  programs = {
    hyprland = {
      enable = true;
      portalPackage = xdg-desktop-portal-hyprland;
    };
  };

  environment = {
    systemPackages = [
      hyprpaper
      rofi-wayland
      waybar
      grim
      slurp
      jq
      wl-clipboard
    ];
  };
}
