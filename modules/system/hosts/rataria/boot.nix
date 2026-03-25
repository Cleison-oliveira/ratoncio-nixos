{
  flake.modules.nixos.rataria = {pkgs, ...}: {
    boot = {
      kernelParams = [
        "quiet"
        "splash"
        "rd.systemd.show_status=false"
        "udev.log_level=3"
        "nvidia-drm.modeset=1"
        "nvidia-drm.fbdev=1"
      ];

      kernelModules = [
        "kvm-amd"
        "ntsync"
        "tun"
        "i2c-dev"
        "i2c-i801"
        "i2c-nvidia-gpu"
      ];

      initrd = {
        verbose = false;
        availableKernelModules = [
          "nvme"
          "xhci_pci"
          "ahci"
          "usbhid"
          "usb_storage"
          "sd_mod"
        ];
        kernelModules = [
          "nvidia"
          "nvidia_modeset"
          "nvidia_uvm"
          "nvidia_drm"
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
