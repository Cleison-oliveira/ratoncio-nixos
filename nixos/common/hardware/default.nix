{ modulesPath, lib, ... }: {
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
    ./graphics.nix
    ./keyboard.nix
    ./partition.nix
    ./platform.nix
    ./processor.nix
    ./swapdevices.nix
  ];

  networking = {
    useDHCP = lib.mkDefault true;
    #interfaces.eno1.useDHCP = lib.mkDefault true;
  };
}
