{ pkgs, ... }: with pkgs; {
  security = {
    rtkit = {
      enable = true;
    };
    doas = {
      enable = true;
    };
    sudo = {
      enable = false;
    };
    polkit = {
      enable = true;
    };

    protectKernelImage = true;

    wrappers = {
      gsr-kms-server = {
        owner = "root";
        group = "root";
        capabilities = "cap_sys_admin+ep";
        source = "${gpu-screen-recorder}/bin/gsr-kms-server";
      };
    };

    apparmor = {
      enable = true;
    };
  };
}
