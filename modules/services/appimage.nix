{
  flake.modules.nixos.services-appimage = {
    programs.appimage = {
      enable = true;
      binfmt = true;
    };
  };
}
