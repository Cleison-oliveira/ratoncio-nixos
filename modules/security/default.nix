{ config, pkgs, ... }:

{

  security.doas.enable = true;
  security.sudo.enable = false;
  security.polkit.enable = true;
  programs.firejail.enable = true;
  security.protectKernelImage = true;

}
