{inputs, ...}: {
  flake-file.inputs = {
    nix-cachyos-kernel.url = "github:xddxdd/nix-cachyos-kernel/release";
  };

  flake.modules.nixos.rataria = {
    pkgs,
    modulesPath,
    ...
  }: {
    imports = with inputs.self.modules.nixos;
      [
        fonts
        locale
        nix-basic
        security
        systemd-boot
        virtualisation
        zram

        home-manager
        ratoncio

        desktop-plasma
        desktop-ollama
        gaming-steam
        gaming-gamemode
        desktop-xdg
        desktop-comfyui
        services-dbus
        services-docker
        services-fstrim
        services-pipewire
        nvidia
      ]
      ++ [
        (modulesPath + "/installer/scan/not-detected.nix")
      ];

    nixpkgs.overlays = [inputs.nix-cachyos-kernel.overlays.pinned];
    boot.kernelPackages = pkgs.linuxKernel.packagesFor (pkgs.cachyosKernels.linux-cachyos-lts-lto.override {
      processorOpt = "zen4";
    });

    system.stateVersion = "26.05";
    #boot.kernelPackages = pkgs.linuxPackages_latest;
    networking.hostName = "rataria";
    powerManagement.cpuFreqGovernor = "performance";

    documentation = {
      doc.enable = false;
      info.enable = false;
      nixos.enable = false;
      man.cache.enable = true;
    };

    environment = {
      pathsToLink = [
        "/share/applications"
        "/share/xdg-desktop-portal"
      ];
      sessionVariables = {
        NIXOS_OZONE_WL = "1";
      };
    };

    hardware.i2c.enable = true;
    hardware.sane = {
      enable = true;
      extraBackends = with pkgs; [
        hplip
        hplipWithPlugin
      ];
    };

    programs.bash = {
      enable = true;
      completion.enable = true;
      enableLsColors = true;
    };
    programs.dconf.enable = true;
    programs.firejail.enable = true;

    services.xserver.xkb = {
      layout = "us";
      variant = "";
      options = "compose:ralt";
    };
  };
}
