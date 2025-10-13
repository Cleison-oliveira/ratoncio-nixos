{ config, lib, pkgs, ... }:

{
  system.stateVersion = "25.05";

  networking.hostName = "gaming";

  nixpkgs.config.allowUnfree = true;

  boot.kernelPackages = pkgs.linuxPackages_latest;

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
}
