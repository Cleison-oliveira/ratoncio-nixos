{
  flake.modules.homeManager.gaming-basic = {pkgs, ...}: let
    pcsx2-wrapped = pkgs.symlinkJoin {
      name = "pcsx2-wrapped";
      paths = [pkgs.pcsx2];
      buildInputs = [pkgs.makeWrapper];
      postBuild = ''
        wrapProgram $out/bin/pcsx2-qt \
          --set QT_QPA_PLATFORMTHEME xdgdesktopportal
      '';
    };
  in {
    home.packages = with pkgs; [
      dolphin-emu
      faugus-launcher
      heroic
      lsfg-vk
      lsfg-vk-ui
      mangohud
      pcsx2-wrapped
      prismlauncher
      protonup-qt
      steam-run
      umu-launcher
      gamescope
    ];
  };
}
