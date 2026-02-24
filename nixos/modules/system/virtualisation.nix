{ ... }: {
  virtualisation = {
    libvirtd.enable = true;
    podman = {
      enable = true;
      defaultNetwork.settings.dns_enabled = true;
    };
    docker = {
      enable = true;
      rootless = {
        enable = true;
        setSocketVariable = true;
        daemon.settings = {
          dns = [
            "185.228.168.168"
            "185.228.169.168"
          ];
          registry-mirrors = [ "https://mirror.gcr.io" ];
        };
      };
    };
  };
  hardware.nvidia-container-toolkit.enable = true;
}
