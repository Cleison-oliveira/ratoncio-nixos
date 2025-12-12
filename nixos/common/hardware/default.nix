{ modulesPath, ... }: {
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
    ./graphics.nix
    ./keyboard.nix
    ./partition.nix
    ./platform.nix
    ./processor.nix
    ./swapdevices.nix
  ];
}
