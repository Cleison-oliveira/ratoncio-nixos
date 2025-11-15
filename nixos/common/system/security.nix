{ ... }: {
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

    apparmor = {
      enable = true;
    };
  };
}
