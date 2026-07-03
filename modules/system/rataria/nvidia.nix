{
  flake.modules.nixos.nvidia = {
    config,
    pkgs,
    ...
  }: {
    hardware = {
      enableAllFirmware = true;
      graphics = {
        enable = true;
        enable32Bit = pkgs.stdenv.hostPlatform.system == "x86_64-linux";
        extraPackages = with pkgs; [
          mesa
          ddcutil
          nvidia-vaapi-driver
          (writeShellScriptBin "amdgpu" ''
            export DRI_PRIME=0
            export DXVK_FILTER_DEVICE_NAME="Radeon"
            export VKD3D_FILTER_DEVICE_NAME="Radeon"
            unset __NV_PRIME_RENDER_OFFLOAD
            unset __VK_LAYER_NV_optimus
            unset __GLX_VENDOR_LIBRARY_NAME
            exec "$@"
          '')
        ];
      };
      nvidia = {
        modesetting.enable = true;
        open = true;
        nvidiaSettings = true;
        package = config.boot.kernelPackages.nvidiaPackages.latest;
        powerManagement.enable = true;
        prime = {
          offload = {
            enable = true;
            enableOffloadCmd = true;
          };
          amdgpuBusId = "PCI:13:0:0";
          nvidiaBusId = "PCI:1:0:0";
        };
      };
      nvidia-container-toolkit.enable = true;
    };
    environment.systemPackages = with pkgs; [
      cudaPackages.cudatoolkit
      cudaPackages.cudnn
    ];
    environment.sessionVariables = {
      __GLX_VENDOR_LIBRARY_NAME = "nvidia";
    };
    services.xserver.videoDrivers = ["nvidia"];
  };
}
