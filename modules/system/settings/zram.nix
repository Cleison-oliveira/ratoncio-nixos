{
  flake.modules.nixos.zram = {
    swapDevices = [
      {
        device = "/swapfile";
        size = 32 * 1024;
        priority = 10;
      }
    ];
    zramSwap = {
      enable = true;
      algorithm = "zstd";
      memoryPercent = 200;
      priority = 100;
    };
  };
}
