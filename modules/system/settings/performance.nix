{pkgs, ...}: {
  flake.modules.nixos.performance = {
    services.ananicy = {
      enable = true;
      package = pkgs.ananicy-cpp;
      rulesProvider = pkgs.ananicy-rules-cachyos;
    };

    services.udev.extraRules = ''
      # NVMe I/O Scheduler: none (hardware controller manages queues)
      ACTION=="add|change", KERNEL=="nvme[0-9]*n[0-9]*", ATTR{queue/scheduler}="none"
      # Rotational HDD I/O Scheduler: bfq
      ACTION=="add|change", KERNEL=="sd[a-z]", ATTR{queue/rotational}=="1", ATTR{queue/scheduler}="bfq"
    '';
  };
}
