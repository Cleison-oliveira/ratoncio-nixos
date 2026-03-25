{
  self,
  lib,
  ...
}: {
  flake.modules = lib.mkMerge [
    {
      homeManager.ratoncio = {pkgs, ...}:
        with pkgs; let
          keepassxc-wrapped = pkgs.symlinkJoin {
            name = "keepassxc-wrapped";
            paths = [pkgs.keepassxc];
            buildInputs = [pkgs.makeWrapper];
            postBuild = ''
              wrapProgram $out/bin/keepassxc \
                --set QT_QPA_PLATFORMTHEME xdgdesktopportal
            '';
          };

          archive = [
            _7zz
            bzip2
            gnutar
            gzip
            libarchive
            unar
            unrar
            unzip
            xz
            zip
          ];

          basic = [
            busybox
            curl
            fd
            jq
            tree
            wget
          ];

          hardware = [
            usbutils
            vulkan-tools
          ];

          qt = [
            libsForQt5.qtstyleplugins
            qt5.qtbase
            qt5.qtwayland
            qt6.qtbase
            qt6.qtwayland
          ];

          wine = [
            wineWow64Packages.stable
            winetricks
          ];

          graphics = with pkgs; [
            gimp3
            inkscape
            krita
            onlyoffice-desktopeditors
          ];

          internet = with pkgs; [
            discord
            freerdp
            google-chrome
            keet
            librewolf
            qbittorrent
            telegram-desktop
          ];

          multimedia = with pkgs; [
            alsa-utils
            easyeffects
            ffmpeg-full
            gpu-screen-recorder-gtk
            haruna
            pulseaudio
            pulsemixer
          ];

          utilities = with pkgs; [
            keepassxc-wrapped
            vscodium
            wasabiwallet
          ];

          all =
            archive
            ++ basic
            ++ hardware
            ++ qt
            ++ wine
            ++ graphics
            ++ internet
            ++ multimedia
            ++ utilities;
        in {
          home.stateVersion = "26.05";
          home.packages = all;
          programs.git.settings.user = {
            name = "cleison-oliveira";
            email = "cleisonao59@gmail.com";
          };
        };
    }
  ];
}
