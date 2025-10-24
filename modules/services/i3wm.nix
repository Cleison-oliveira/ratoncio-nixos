{ config, lib, pkgs, ... }:

{
  environment.pathsToLink = [ "/libexec" ];

  services.xserver = {
    enable = true;
    videoDrivers = [ "amdgpu" ];

    desktopManager = {
      xterm.enable = false;
    };

    displayManager = {
      startx.enable = true;
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
        i3lock
      ];
    };

    excludePackages = [ pkgs.xterm ];
  };

  # File manager config
  programs.thunar.enable = true;
  programs.xfconf.enable = true;
  programs.thunar.plugins = with pkgs.xfce; [
    thunar-archive-plugin
    thunar-volman
    xfce4-terminal
    ristretto
  ];

  services.tumbler.enable = true;
  environment.etc."X11/xinit/xinitrc".text = builtins.readFile ./xinitrc;

}
