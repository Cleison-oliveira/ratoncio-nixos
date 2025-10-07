{ config, pkgs, ... }:

{

  security.doas.enable = true;
  security.sudo.enable = false;

  programs.firejail.enable = true;
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD

}

=======
  security.protectKernelImage = true;

}
>>>>>>> 0e212d2 (Add security modules)
=======
  security.protectKernelImage = true;

}
>>>>>>> 05c057b (A stable config)
=======
  security.protectKernelImage = true;

}
>>>>>>> master
