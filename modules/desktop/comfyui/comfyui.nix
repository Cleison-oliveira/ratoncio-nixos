{inputs, ...}: {
  flake.modules.nixos.desktop-comfyui = {
    imports = [
      inputs.comfyui-nix.nixosModules.default
    ];

    services.comfyui = {
      enable = true;
      gpuSupport = "cuda";
      cudaCapabilities = ["12.0"];
      enableManager = true;
      port = 8188;
      listenAddress = "127.0.0.1";
      dataDir = "/var/lib/comfyui";
      openFirewall = false;
    };
  };
}
