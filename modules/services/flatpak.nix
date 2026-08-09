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
        {
          name = "flathub-beta";
          location = "https://flathub.org/beta-repo/flathub-beta.flatpakrepo";
        }
      ];

      packages =
        (
          map (appId: {
            inherit appId;
            origin = "flathub";
          }) [
            "io.keet.Keet"
            "net.rpcs3.RPCS3"
            "org.freedesktop.Platform.VulkanLayer.lsfgvk//25.08"
            "org.freedesktop.Platform.VulkanLayer.lsfgvk//24.08"
          ]
        )
        ++ [
          {
            appId = "net.pcsx2.PCSX2";
            origin = "flathub-beta";
          }
        ];

      update = {
        onActivation = true;
      };
    };
  };
}
