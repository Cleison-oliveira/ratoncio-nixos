{ ... }: {
  environment = {
    variables = {
      QT_QPA_PLATFORMTHEME = "qt6ct";
      QT_PLATFORM_PLUGIN = "qt6ct";
      QT6CT_PLATFORMTHEME = "qt6ct";
      EDITOR = "nvim";
      GTK_USE_PORTAL = "1";
      TERMINAL = "xfce4-terminal";
      XFCE_TERMINAL = "xfce4-terminal";
      GTK_THEME = "catppuccin-mocha-blue-standard";

    };
    sessionVariables = {
      # Session
      XDG_CURRENT_DESKTOP = "Hyprland";
      XDG_SESSION_DESKTOP = "Hyprland";
      XDG_SESSION_TYPE = "wayland";

      # Wayland
      MOZ_ENABLE_WAYLAND = "1";
      MOZ_USE_XINPUT2 = "1";
      QT_QPA_PLATFORM = "wayland";
      QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
      SDL_VIDEODRIVER = "wayland";
    };
  };
}
