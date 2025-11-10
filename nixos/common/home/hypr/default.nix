{ ... }: {

  home = {
    file.".config/hypr/hyprpaper.conf".text = ''
      preload =  ~/.config/wallpaper.png
      wallpaper = DP-3, ~/.config/wallpaper.png
    '';

    file.".config/hypr/hyprland.conf".text =
      builtins.readFile ./hyprland.conf;
  };
}
