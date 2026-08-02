{lib, ...}: {
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
            p7zip
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
            tesseract
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
            blender
            davinci-resolve
            gimp3
            inkscape
            krita
            onlyoffice-desktopeditors
          ];

          internet = with pkgs; [
            discord
            freerdp
            google-chrome
            firefox
            qbittorrent
            telegram-desktop
          ];

          multimedia = with pkgs; [
            alsa-utils
            easyeffects
            ffmpeg-full
            gpu-screen-recorder-gtk
            haruna
            tonelib-metal
            lsp-plugins
            neural-amp-modeler-lv2
          ];

          utilities = with pkgs; [
            keepassxc-wrapped
            opencode-desktop
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
          home.packages = all;
          home.sessionVariables = {
            EDITOR = "nvim";
            VISUAL = "nvim";
            NIXPKGS_ALLOW_UNFREE = 1;
          };
          programs.git.settings.user = {
            name = "cleison-oliveira";
            email = "cleisonao59@gmail.com";
          };
        };
    }
  ];
}
