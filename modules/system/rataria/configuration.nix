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
        ratoncio
        desktop-plasma
        desktop-ollama
        gaming-steam
        gaming-gamemode
        desktop-xdg
        desktop-comfyui
        services-docker
        nvidia

        system-cli
        system-default
        system-desktop
        system-minimal
        services-flatpak
        #services-clamav
        #services-waydroid
      ]
      ++ [
        (modulesPath + "/installer/scan/not-detected.nix")
      ];

    #boot.kernelPackages = pkgs.linuxPackages_latest;
    boot.kernelPackages = inputs.nix-cachyos-kernel.legacyPackages.${pkgs.stdenv.hostPlatform.system}.linuxPackages-cachyos-latest-lto-zen4;
    networking.hostName = "rataria";
    powerManagement.cpuFreqGovernor = "performance";

    hardware.i2c.enable = true;
    hardware.sane = {
      enable = true;
      extraBackends = with pkgs; [
        hplip
        hplipWithPlugin
      ];
    };
  };
}
