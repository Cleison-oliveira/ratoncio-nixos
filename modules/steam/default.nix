{ config, lib, pkgs, ... }:

let
  unstable = import
    (builtins.fetchTarball {
      url = "https://github.com/NixOS/nixpkgs/archive/nixos-unstable.tar.gz";
      sha256 = "02w5j06nl2gddh9ifz1647b8bilhzkqg9c93f14cl4k0kq9c8fl1";
    })
    {
      system = pkgs.system;
      config.allowUnfree = true;
    };
in
{
  imports = [
    ../hardware-configuration.nix
  ];

  specialisation = {
    steamos = {
      inheritParentConfig = false;
      configuration = {

        imports = [
          ../hardware-configuration.nix
          ../i3wm
          ../sys-packages
          ./gaming
          ../fish
          ../security
          ../networking
        ];

        system.stateVersion = "25.05";

        security.doas.extraRules = [{
          users = [ "steam" ];
          keepEnv = true;
          persist = true;
        }];

        nixpkgs.config.allowUnfree = true;

        boot.kernelPackages = pkgs.linuxPackages_latest;

        users.users.steam = {
          shell = pkgs.fish;
          isNormalUser = true;
          description = "steam user";
          extraGroups = [
            "networkmanager"
            "wheel"
            "allowusers"
            "gamemode"
            "input"
            "audio"
            "render"
            "video"
          ];

          packages = import ./user-packages { inherit pkgs unstable; };
          hashedPassword = "$6$dt44z3QLC3K/FN3E$fDcoLNUmuqjFNxZIjq37NcuWt7Qfn06wJua.5lLlJNOxZrzLJwP3wbxlbm5Hpz9MZoMV3KCfWvGENAxdnNCV//";
        };

        boot.kernelParams = [
          "pcie_aspm=off"
          "quiet"
        ];

        hardware.enableAllFirmware = true;
        hardware.graphics = {
          enable = true;
          enable32Bit = true;
        };

        services.gvfs.enable = true;

        security.rtkit.enable = true;
        services.pipewire = {
          enable = true;
          alsa.enable = true;
          alsa.support32Bit = true;
          pulse.enable = true;
        };

        environment.variables = {
          GTK_THEME = "Catppuccin-Mocha-Standard-Mauve-Dark";
          QT_QPA_PLATFORMTHEME = "qt6ct";
          XCURSOR_SIZE = "24";
          EDITOR = "nvim";
        };

        services.xserver.xkb = {
          layout = "us";
          variant = "";
          options = "compose:ralt";
        };

        time.timeZone = "America/Bahia";

        i18n.defaultLocale = "en_US.UTF-8";
        i18n.extraLocaleSettings = {
          LC_ADDRESS = "pt_BR.UTF-8";
          LC_IDENTIFICATION = "pt_BR.UTF-8";
          LC_MEASUREMENT = "pt_BR.UTF-8";
          LC_MONETARY = "pt_BR.UTF-8";
          LC_NAME = "pt_BR.UTF-8";
          LC_NUMERIC = "pt_BR.UTF-8";
          LC_PAPER = "pt_BR.UTF-8";
          LC_TELEPHONE = "pt_BR.UTF-8";
          LC_TIME = "pt_BR.UTF-8";
        };
      };
    };
  };
}
