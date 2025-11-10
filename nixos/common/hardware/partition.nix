{ ... }:
{
  fileSystems."/" = {
    device = "/dev/disk/by-uuid/c883de07-382b-492b-9b7e-a154a4fa89ab";
    fsType = "ext4";
  };

  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/C8E8-3D10";
    fsType = "vfat";
    options = [ "fmask=0077" "dmask=0077" ];
  };

  fileSystems."/mnt/ratfiles" = {
    device = "UUID=0ebebcab-68fa-4687-9a09-a7e320c4d14c";
    fsType = "ext4";
    options = [ "defaults" "auto" ];
  };

  fileSystems."/mnt/ratgames" = {
    device = "UUID=0cca1578-a07c-4a70-b5e8-1097ffe1261e";
    fsType = "xfs";
    options = [ "defaults" "auto" ];
  };
}
