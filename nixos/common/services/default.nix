{ ... }: {
  imports = [
    ./dbus.nix
    ./file-manager.nix
    ./fstrim.nix
    ./gvfs.nix
    ./hyprland.nix
    ./pipewire.nix
    ./tumbler.nix
    ./xserver.nix
  ];
}
