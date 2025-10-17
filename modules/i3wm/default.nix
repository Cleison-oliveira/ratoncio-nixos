{ config, lib, pkgs, ... }:

{
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
        gtk-engine-murrine
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
  services.gvfs.enable = true;
  programs.i3lock.enable = true;
  services.xserver.excludePackages = [ pkgs.xterm ];

  # File manager config
  programs.thunar.enable = true;
  programs.xfconf.enable = true;
  programs.thunar.plugins = with pkgs.xfce; [
    thunar-archive-plugin
    thunar-volman
    xfce4-terminal
    ristretto
  ];

  environment.etc."X11/xinit/xinitrc".text = builtins.readFile ./xinitrc;

  services.tumbler.enable = true;
}
