{ inputs, ... }:
{
  imports = [
    ../modules
    inputs.nix-flatpak.homeManagerModules.nix-flatpak
  ];

  home = {
    username = "ratoncio";
    homeDirectory = "/home/ratoncio";
    stateVersion = "26.05";
    sessionVariables = {
      KRITA_NO_STYLE_OVERRIDE = "1";
      EDITOR = "nvim";
      VISUAL = "nvim";
      PAGER = "less";

      _JAVA_AWT_WM_NONREPARENTING = "1";
    };
  };
}
