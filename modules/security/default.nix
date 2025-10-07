{ config, pkgs, ... }:

{

  security.doas.enable = true;
  security.sudo.enable = false;

  programs.firejail.enable = true;
<<<<<<< HEAD

}

=======
  security.protectKernelImage = true;

}
>>>>>>> 0e212d2 (Add security modules)
