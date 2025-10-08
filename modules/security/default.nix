{ config, pkgs, ... }:

{

  security.doas.enable = true;
  security.sudo.enable = false;
  programs.firejail.enable = true;
  security.protectKernelImage = true;

}
