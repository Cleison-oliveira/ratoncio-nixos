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

  fileSystems."/mnt/emulation" = {
    device = "UUID=0cca1578-a07c-4a70-b5e8-1097ffe1261e";
    fsType = "xfs";
    options = [ "defaults" "auto" ];
  };

  fileSystems."/mnt/HDD" = {
    device = "UUID=dc9bf1d6-f124-4860-84e0-18d418e916d2";
    fsType = "ext4";
    options = [ "defaults" "auto" ];
  };

  fileSystems."/mnt/Downloads" = {
    device = "UUID=b14b0108-c09d-4c7f-8b64-a2302da6f80d";
    fsType = "ext4";
    options = [ "defaults" "auto" ];
  };
}
