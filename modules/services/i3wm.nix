{ pkgs, ... }: {

  environment = {
    pathsToLink = [ "/libexec" ];
    etc."X11/xinit/xinitrc".text = builtins.readFile ./xinitrc;
  };

  services = {
    xserver = {
      enable = true;
      videoDrivers = [ "amdgpu" ];
      deviceSection = ''
        Option "TearFree" "on"
        Option "VariableRefresh" "true"
      '';

      desktopManager = {
        xterm = {
          enable = false;
        };
      };

      displayManager = {
        startx = {
          enable = true;
        };
      };

      windowManager = {
        i3 = {
          enable = true;
          extraPackages = with pkgs; [
            rofi
            i3blocks
            i3status-rust
            lxappearance
            xclip
            maim
            i3lock
            python3Packages.i3ipc
            autotiling
          ];
        };
      };
      excludePackages = [ pkgs.xterm ];
    };
  };
}
