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
          ddcutil
          nvidia-vaapi-driver
        ];
      };
      nvidia = {
        modesetting.enable = true;
        open = true;
        nvidiaSettings = true;
        package = config.boot.kernelPackages.nvidiaPackages.beta;
        powerManagement.enable = true;
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
