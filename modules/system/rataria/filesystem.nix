{
  flake.modules.nixos.rataria = {
    fileSystems = {
      "/" = {
        device = "/dev/disk/by-uuid/c883de07-382b-492b-9b7e-a154a4fa89ab";
        fsType = "ext4";
      };

      "/boot" = {
        device = "/dev/disk/by-uuid/C8E8-3D10";
        fsType = "vfat";
        options = ["fmask=0077" "dmask=0077"];
      };

      "/mnt/HDD" = {
        device = "UUID=dc9bf1d6-f124-4860-84e0-18d418e916d2";
        fsType = "ext4";
        options = ["auto" "nofail" "users" "exec"];
      };

      "/mnt/Emulation" = {
        device = "UUID=0cca1578-a07c-4a70-b5e8-1097ffe1261e";
        fsType = "xfs";
        options = ["auto" "nofail" "users" "exec"];
      };

      "/mnt/RatFiles" = {
        device = "UUID=11e3fbad-c132-4b2d-896f-1527d15fb41f";
        fsType = "xfs";
        options = ["auto" "nofail" "users" "exec"];
      };
    };
  };
}
