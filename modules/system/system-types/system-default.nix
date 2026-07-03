{inputs, ...}: {
  flake.modules.nixos.system-default = {
    imports = with inputs.self.modules.nixos; [
      documentation
      fonts
      home-manager
      locale

      services-fstrim
      services-pipewire

      systemd-boot
      security
      virtualisation
      zram
    ];
  };
  flake.modules.homeManager.system-default = {
    imports = with inputs.self.modules.homeManager; [
    ];
  };
}
