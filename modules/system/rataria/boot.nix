{
  flake.modules.nixos.rataria = {pkgs, ...}: {
    boot = {
      kernelParams = [
        "quiet"
        "splash"
        "rd.systemd.show_status=false"
        "udev.log_level=3"
        "amd_pstate=active"
        "nowatchdog"
        "split_lock_mitigate=0"
      ];

      kernelModules = [
        "kvm-amd"
        "ntsync"
        "tun"
        "tcp_bbr"
      ];

      initrd = {
        systemd.enable = true;
        verbose = false;
        availableKernelModules = [
          "nvme"
          "xhci_pci"
          "ahci"
          "usbhid"
          "usb_storage"
          "sd_mod"
        ];
      };

      consoleLogLevel = 3;

      kernel.sysctl = {
        "vm.swappiness" = 180;
        "vm.vfs_cache_pressure" = 50;
        "vm.page-cluster" = 0;
        "vm.dirty_bytes" = 268435456;
        "vm.dirty_background_bytes" = 67108864;
        "net.core.default_qdisc" = "cake";
        "net.ipv4.tcp_congestion_control" = "bbr";
        "net.ipv4.tcp_fastopen" = 3;
      };

      plymouth = {
        enable = true;
        theme = "nixos-bgrt";
        themePackages = with pkgs; [nixos-bgrt-plymouth];
      };
    };
  };
}
