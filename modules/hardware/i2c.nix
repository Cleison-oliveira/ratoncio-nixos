{
  flake.modules.nixos.hardware-i2c = {...}: {
    boot.kernelModules = [
      "i2c-dev"
      "i2c-i801"
      "i2c-nvidia-gpu"
    ];
    hardware.i2c.enable = true;
  };
}
