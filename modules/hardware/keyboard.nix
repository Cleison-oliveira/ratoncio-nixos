{ config, lib, ... }: {
  services.xserver.xkb = {
    layout = "us";
    variant = "";
    options = "compose:ralt";
  };
}
