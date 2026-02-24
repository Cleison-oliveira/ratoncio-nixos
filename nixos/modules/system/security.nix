{ pkgs, ... }:
{
  security = {
    doas = {
      enable = true;
      extraRules = [
        {
          users = [ "ratoncio" ];
          keepEnv = true;
          persist = true;
        }
      ];
    };

    rtkit.enable = true;
    sudo.enable = false;
    polkit.enable = true;
    apparmor.enable = true;

    protectKernelImage = true;

    wrappers.gsr-kms-server = with pkgs; {
      owner = "root";
      group = "root";
      capabilities = "cap_sys_admin+ep";
      source = "${gpu-screen-recorder}/bin/gsr-kms-server";
    };
  };
}
