{ ... }: {
  boot = {
    kernelParams = [
      "pcie_aspm=off"
      "quiet"
      "udev.log_level=3"
      "video=efifb:1920x1080"
      "nvidia-drm.modeset=1"
      "nvidia-drm.fbdev=1"
    ];

    kernelModules = [
      "kvm-amd"
      "tun"
      "i2c-dev"
    ];

    initrd = {
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

    extraModulePackages = [ ];

    kernel = {
      sysctl = {
        "net.ipv4.ip_unprivileged_port_start" = 53;
        "vm.swappiness" = 10;
      };
    };

    loader = {
      systemd-boot = {
        enable = true;
      };
      timeout = 0;
      efi = {
        canTouchEfiVariables = true;
      };
    };
  };
}
