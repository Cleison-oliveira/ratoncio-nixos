{ pkgs, config, ... }:
let
  color = "catppuccin-mocha-blue.conf";

  kvTheme = pkgs.catppuccin-kvantum.override {
    variant = "mocha";
    accent = "blue";
  };

  colorScheme = import ./color-scheme.nix;

  qtConf = dialogType: qtctDir: ''
    [Appearance]
    color_scheme_path=${config.home.homeDirectory}/.config/${qtctDir}/colors/${color}
    custom_palette=true
    icon_theme=Papirus-Dark
    standard_dialogs=${dialogType}
    style=kvantum-dark

    [Fonts]
    fixed="Ubuntu Nerd Font,11,-1,5,50,0,0,0,0,0,Regular"
    general="Ubuntu Nerd Font,11,-1,5,50,0,0,0,0,0,Regular"

    [Interface]
    activate_item_on_single_click=1
    buttonbox_layout=3
    cursor_flash_time=1000
    dialog_buttons_have_icons=0
    double_click_interval=400
    gui_effects=@Invalid()
    keyboard_scheme=4
    menus_have_icons=false
    show_shortcuts_in_context_menus=false
    stylesheets=@Invalid()
    toolbutton_style=1
    underline_shortcut=1
    wheel_scroll_lines=3

    [Troubleshooting]
    force_raster_widgets=1
  '';
in
{
  xdg.configFile = {
    "Kvantum/catppuccin-mocha-blue".source = "${kvTheme}/share/Kvantum/catppuccin-mocha-blue";

    "Kvantum/kvantum.kvconfig".text = ''
      [General]
      theme=catppuccin-mocha-blue
    '';

    "qt5ct/qt5ct.conf".text = qtConf "gtk2" "qt5ct";
    "qt6ct/qt6ct.conf".text = qtConf "xdgdesktopportal" "qt6ct";

    "qt5ct/colors/${color}".text = colorScheme;
    "qt6ct/colors/${color}".text = colorScheme;
  };

  qt = {
    enable = true;
    platformTheme.name = "qtct";
  };

  home.packages = with pkgs; [
    adwaita-icon-theme
    hicolor-icon-theme
    kvTheme
    libsForQt5.qtstyleplugin-kvantum
    qt6Packages.qtstyleplugin-kvantum
  ];
}
