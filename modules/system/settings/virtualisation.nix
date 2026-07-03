{
  flake.modules.nixos.virtualisation = {pkgs, ...}: {
    virtualisation = {
      libvirtd = {
        enable = true;
        qemu.swtpm.enable = true;
      };
      podman = {
        enable = true;
        defaultNetwork.settings.dns_enabled = true;
      };
      spiceUSBRedirection.enable = true;
    };
    services.spice-vdagentd.enable = true;
    environment.systemPackages = with pkgs; [
      swtpm
      distrobox
    ];
  };
}
