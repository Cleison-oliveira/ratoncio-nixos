{ ... }: {
  home = {
    file = {
      ".config/waybar/config".text =
        builtins.readFile ./config;

      ".config/waybar/style.css".text =
        builtins.readFile ./style.css;
    };
  };
}
