{ config, lib, pkgs, ... }:

{
<<<<<<< HEAD

=======
>>>>>>> 05c057b (A stable config)
  imports = [
    ./picom.nix
  ];

  environment.pathsToLink = [ "/libexec" ];
  services.xserver = {
    enable = true;
    videoDrivers = [ "amdgpu" ];
    desktopManager = {
      xterm.enable = false;
    };

    windowManager.i3 = {
      enable = true;
      extraPackages = with pkgs; [
        rofi
        i3blocks
        i3status-rust
        lxappearance
        xclip
        maim
<<<<<<< HEAD
<<<<<<< HEAD

=======
>>>>>>> 0e212d2 (Add security modules)
=======
>>>>>>> 05c057b (A stable config)
      ];
    };
  };

  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
    config = {
      common.default = [ "gtk" ];
    };
  };

  services.xserver.displayManager.startx.enable = true;
  services.dbus.enable = true;
  programs.i3lock.enable = true;
  services.xserver.excludePackages = [ pkgs.xterm ];

  # File manager config
  programs.thunar.enable = true;
  programs.xfconf.enable = true;
  programs.thunar.plugins = with pkgs.xfce; [
    thunar-archive-plugin
    thunar-volman
<<<<<<< HEAD
<<<<<<< HEAD

=======
    xfce4-terminal
    ristretto
>>>>>>> 0e212d2 (Add security modules)
=======
    xfce4-terminal
    ristretto
>>>>>>> 05c057b (A stable config)
  ];

  environment.etc."X11/xinit/xinitrc".text = builtins.readFile ./xinitrc;

  services.tumbler.enable = true;
}
