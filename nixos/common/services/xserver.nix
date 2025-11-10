{ pkgs, ... }: with pkgs; {

  environment = {
    pathsToLink = [ "/libexec" ];
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
      excludePackages = [ xterm ];
    };
  };
}
