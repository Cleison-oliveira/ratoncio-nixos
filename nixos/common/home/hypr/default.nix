{ ... }: {

  home = {
    file = {
      ".config/hypr/hyprpaper.conf".text = ''
        preload =  ~/.config/wallpaper.png
        wallpaper = DP-3, ~/.config/wallpaper.png
      '';

      ".config/hypr/hyprland.conf".text =
        builtins.readFile ./hyprland.conf;
    };
  };
}
