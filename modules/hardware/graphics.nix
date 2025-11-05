{ unstable, ... }: with unstable; 
{
  hardware = {
    enableAllFirmware = true;
    graphics = {
      enable = true;
      enable32Bit = true;
      package = mesa;
    };
  };
}
