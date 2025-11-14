{ ... }: {

  home = {
    file = {
      ".config/hypr/hyprland.conf".text =
        builtins.readFile ./hyprland.conf;
    };
  };
}
