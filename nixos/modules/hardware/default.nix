{ modulesPath, ... }:
{
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
    ./graphics.nix
    ./i2c.nix
    ./keyboard.nix
    ./partition.nix
    ./platform.nix
    ./processor.nix
    ./sane.nix
    ./swapdevices.nix
  ];
}
