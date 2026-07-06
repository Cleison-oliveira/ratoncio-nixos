{inputs, ...}: {
  flake-file.inputs = {
    nix-flatpak.url = "github:gmodena/nix-flatpak";
  };

  flake.modules.nixos.services-flatpak = {
    services.flatpak.enable = true;
  };

  flake.modules.homeManager.services-flatpak = {...}: {
    imports = [inputs.nix-flatpak.homeManagerModules.nix-flatpak];
    services.flatpak = {
      enable = true;
      uninstallUnmanaged = true;
      remotes = [
        {
          name = "flathub";
          location = "https://dl.flathub.org/repo/flathub.flatpakrepo";
        }
      ];

      packages =
        map (appId: {
          inherit appId;
          origin = "flathub";
        }) [
          "io.keet.Keet"
          "net.rpcs3.RPCS3"
          "net.pcsx2.PCSX2"
        ];

      update = {
        onActivation = true;
      };
    };
  };
}
