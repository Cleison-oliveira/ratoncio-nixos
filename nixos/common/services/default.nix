{ ... }: {
  imports = [
    ./dbus.nix
    ./fstrim.nix
    ./gvfs.nix
    ./pipewire.nix
    ./tumbler.nix
    ./xserver.nix
  ];
}
