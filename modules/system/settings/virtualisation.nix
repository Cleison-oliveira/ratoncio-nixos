{
  flake.modules.nixos.virtualisation = {pkgs, ...}: {
    virtualisation = {
      libvirtd = {
        enable = true;
        qemu.swtpm.enable = true;
      };
      spiceUSBRedirection.enable = true;
    };
    services.spice-vdagentd.enable = true;
    environment.systemPackages = with pkgs; [
      swtpm
    ];
  };
}
