{ pkgs, ... }: with pkgs; {
  services = {
    dbus = {
      enable = true;
      packages = [
        gcr
      ];
    };
  };
}
