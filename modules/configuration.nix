{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./sys-packages
    ./i3wm
    ./steam
    ./fish
    ./security
    ./networking
    ./virtualization
  ];

  system.stateVersion = "25.05";

  security.doas.extraRules = [{
    users = [ "ratoncio" ];
    keepEnv = true;
    persist = true;
  }];

  users.users.ratoncio = {
    isNormalUser = true;
    shell = pkgs.fish;
    description = "ratoncio";
    extraGroups = [
      "networkmanager"
      "wheel"
      "allowusers"
      "docker"
      "input"
      "audio"
      "render"
      "video"
    ];
    packages = with pkgs; [
    ];
    hashedPassword = "$6$4jahjQj8GmEKllbZ$qDP2NqWQ3R4XzU8C66S8dWp1hGFW4QdSL1biKndyp.O31yvhvZWJbKYGEUwVfOa6UWYgWsjDPItsQNhbeTK3N1";
  };

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

  services.xserver.xkb = {
    layout = "us";
    variant = "";
    options = "compose:ralt";
  };

  environment.variables = {
    GTK_THEME = "Catppuccin-Mocha-Standard-Mauve-Dark";
    QT_QPA_PLATFORMTHEME = "qt6ct";
    XCURSOR_THEME = "Breeze_Light";
    GTK_ICON_THEME = "Papirus-Dark";
    XCURSOR_SIZE = "24";
    EDITOR = "nvim";
  };

  fonts.packages = with pkgs; [
    font-awesome
    nerd-fonts.fira-code
    nerd-fonts.ubuntu
    nerd-fonts.jetbrains-mono
    dejavu_fonts
    liberation_ttf
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-emoji
    powerline-fonts
    corefonts
    powerline-symbols
    nerd-fonts.adwaita-mono
    nerd-fonts.jetbrains-mono
  ];
}
