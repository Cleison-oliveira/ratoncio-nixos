{
  flake.modules.nixos.security = {pkgs, ...}: {
    security = {
      pam.services.sddm.enableKwallet = true;
      rtkit.enable = true;
      sudo.enable = false;
      doas.enable = true;
      polkit.enable = true;
      protectKernelImage = true;

      wrappers.gsr-kms-server = with pkgs; {
        owner = "root";
        group = "root";
        capabilities = "cap_sys_admin+ep";
        source = "${gpu-screen-recorder}/bin/gsr-kms-server";
      };
    };
  };
}
