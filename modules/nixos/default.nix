{ config, pkgs, ... }:

{
  system.stateVersion = "25.05";

  networking.hostName = "rataria";

  security.doas.extraRules = [{
    users = [ "ratoncio" ];
    keepEnv = true;
    persist = true;
  }];

  boot.kernelParams = [
    "pcie_aspm=off"
    "quiet"
  ];

  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  services.gvfs.enable = true;

  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  hardware = {
    enableAllFirmware = true;
    graphics = {
      enable = true;
      enable32Bit = true;
    };
  };

  boot.loader.systemd-boot.enable = true;
  boot.loader.timeout = 0;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.kernelPackages = pkgs.linuxPackages_latest;

  programs.git.enable = true;

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

    environment.variables = {
    # Session
    XDG_CURRENT_DESKTOP = "i3";
    XDG_SESSION_DESKTOP = "i3";
    XDG_SESSION_TYPE = "x11";

    # GTK Theme
    GTK_THEME = "Catppuccin-Mocha-Standard-Mauve-Dark";
    GTK_ICON_THEME = "Papirus-Dark";

    XCURSOR_SIZE = "24";
    XCURSOR_THEME = "Breeze_Light";

    QT_QPA_PLATFORMTHEME = "qt6ct";

    EDITOR = "nvim";
  };

  services.xserver.xkb = {
    layout = "us";
    variant = "";
    options = "compose:ralt";
  };
}
