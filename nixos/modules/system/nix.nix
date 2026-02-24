{ pkgs, ... }:
{
  nixpkgs.config = {
    allowUnfree = true;
    allowBroken = false;
  };
  programs.nix-ld = with pkgs; {
    enable = true;
    libraries = [
      mesa
      libGL
      libGLU
      libxkbcommon
      fontconfig
      freetype
      glib
      libX11
      libXext
      libXrender
      libSM
      libICE
      libXrandr
      libXi
      libXcursor
      libXinerama
    ];
  };

  nix = {
    settings.experimental-features = [
      "nix-command"
      "flakes"
    ];
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--max-freed 1G --delete-older-than 7d";
    };
    optimise.automatic = true;
    settings = {
      allowed-users = [ "@wheel" ];
      auto-optimise-store = true;
      sandbox = true;
      substituters = [ "https://attic.xuyh0120.win/lantian" ];
      trusted-public-keys = [ "lantian:EeAUQ+W+6r7EtwnmYjeVwx5kOGEBpjlBfPlzGlTNvHc=" ];
    };
  };
}
