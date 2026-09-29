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
        map (appId: {
          inherit appId;
          origin = "flathub";
        }) [
          "io.keet.Keet"
          "org.DolphinEmu.dolphin-emu"
          "net.davidotek.pupgui2"
        ];

      update = {
        onActivation = true;
      };
    };
  };
}
