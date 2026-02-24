{ pkgs, ... }:
{
  environment.pathsToLink = [ "/libexec" ];
  services.xserver = {
    enable = true;
    videoDrivers = [ "nvidia" "amdgpu" ];
    deviceSection = ''
      Option "TearFree" "on"
      Option "VariableRefresh" "true"
    '';

    desktopManager.xterm.enable = false;

    displayManager = {
      startx.enable = true;
      sessionCommands = ''
        eval $(dbus-launch --exit-with-session --sh-syntax)
      '';
    };
    excludePackages = [ pkgs.xterm ];
  };
}
