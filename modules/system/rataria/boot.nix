{
  flake.modules.nixos.rataria = {pkgs, ...}: {
    boot = {
      kernelParams = [
        "quiet"
        "splash"
        "rd.systemd.show_status=false"
        "udev.log_level=3"
      ];

      kernelModules = [
        "kvm-amd"
        "ntsync"
        "tun"
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
        "vm.swappiness" = 10;
      };

      plymouth = {
        enable = true;
        theme = "nixos-bgrt";
        themePackages = with pkgs; [nixos-bgrt-plymouth];
      };
    };
  };
}
