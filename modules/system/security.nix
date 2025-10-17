{ config, pkgs, ... }: {
  security.rtkit.enable = true;
  security.doas.enable = true;
  security.sudo.enable = false;
  security.polkit.enable = true;
  security.protectKernelImage = true;
  programs.firejail.enable = true;
}
