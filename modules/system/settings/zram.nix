{
  flake.modules.nixos.zram = {
    swapDevices = [
      {
        device = "/swapfile";
        size = 16 * 1024;
        priority = 10;
      }
    ];
    zramSwap = {
      enable = true;
      algorithm = "lz4";
      memoryPercent = 100;
      priority = 100;
    };
  };
}
