{inputs, ...}: {
  flake-file.inputs = {
    nix-cachyos-kernel.url = "github:xddxdd/nix-cachyos-kernel/release";
  };
  flake.modules.nixos.rataria = {
    pkgs,
    modulesPath,
    ...
  }: let
    cachyPkgs = inputs.nix-cachyos-kernel.legacyPackages.${pkgs.stdenv.hostPlatform.system};
  in {
    _module.args.inputs = inputs;
    imports = with inputs.self.modules.nixos;
      [
        ratoncio
        desktop-plasma
        desktop-ollama
        gaming-steam
        gaming-gamemode
        desktop-xdg
        desktop-comfyui

        hardware-nvidia
        hardware-sane
        hardware-i2c

        system-cli
        system-default
        system-desktop
        system-minimal
        services-appimage
        services-flatpak
        services-docker

        #services-clamav
        #services-waydroid
      ]
      ++ [
        (modulesPath + "/installer/scan/not-detected.nix")
      ];

    boot.kernelPackages = cachyPkgs.linuxPackages-cachyos-latest-lto-zen4;
    networking.hostName = "rataria";
    powerManagement.cpuFreqGovernor = "performance";
  };
}
