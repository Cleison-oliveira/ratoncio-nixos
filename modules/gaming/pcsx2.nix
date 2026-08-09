{
  flake.modules.homeManager.gaming-pcsx2 = {
    pkgs,
    lib,
    ...
  }: let
    pcsx2NightlyTag = "v2.7.518";

    pcsx2PatchesRev = "9b193aa0a61f5e93d3bd4124b111e8f296ef9fa8";

    pcsx2Src = pkgs.fetchFromGitHub {
      name = "pcsx2-source";
      owner = "PCSX2";
      repo = "pcsx2";
      tag = pcsx2NightlyTag;
      leaveDotGit = true;
      hash = "sha256-nWTO7pySJD9Kjp437pclKAp+Su5/DlR43trr14jQzgY=";
    };

    pcsx2Patches = pkgs.fetchFromGitHub {
      owner = "PCSX2";
      repo = "pcsx2_patches";
      rev = pcsx2PatchesRev;
      hash = "sha256-1hhdjFxJCNfeO/FIAnjRHESfiyzkErYddZqpRxzG7VQ=";
    };

    rapidyamlVersion = "0.9.0";
    rapidyaml = pkgs.llvmPackages.stdenv.mkDerivation (finalAttrs: {
      pname = "rapidyaml";
      version = rapidyamlVersion;

      src = pkgs.fetchFromGitHub {
        owner = "biojppm";
        repo = "rapidyaml";
        tag = "v${finalAttrs.version}";
        fetchSubmodules = true;
        hash = "sha256-+ENfflVjeesX14m0G71HdeSIECopZV4J2JL9+c+nbXE=";
      };

      nativeBuildInputs = [pkgs.cmake pkgs.git];

      cmakeFlags = [
        (lib.cmakeBool "RYML_BUILD_TESTS" false)
        (lib.cmakeBool "RYML_DEV" false)
      ];

      meta = {
        description = "Rapid YAML parser/emitter (ryml) — dependência do PCSX2 nightly ainda não empacotada no nixpkgs";
        homepage = "https://github.com/biojppm/rapidyaml";
        license = lib.licenses.mit;
        platforms = lib.platforms.unix;
      };
    });

    inherit (pkgs.qt6) qtbase qtsvg qttools qtwayland wrapQtAppsHook;

    commonMeta = {
      homepage = "https://pcsx2.net";
      description = "Playstation 2 emulator (nightly pre-release build, via wrapper)";
      changelog = "https://github.com/PCSX2/pcsx2/releases/tag/${pcsx2NightlyTag}";
      downloadPage = "https://github.com/PCSX2/pcsx2/releases";
      license = with lib.licenses; [gpl3Plus lgpl3Plus];
      mainProgram = "pcsx2-qt";
      platforms = ["x86_64-linux"];
    };

    pcsx2Nightly = pkgs.llvmPackages.stdenv.mkDerivation (finalAttrs: {
      pname = "pcsx2-nightly";
      version = builtins.substring 1 (builtins.stringLength pcsx2NightlyTag) pcsx2NightlyTag;
      src = pcsx2Src;

      cmakeFlags = [
        (lib.cmakeBool "PACKAGE_MODE" true)
        (lib.cmakeBool "DISABLE_ADVANCE_SIMD" true)
        (lib.cmakeBool "USE_LINKED_FFMPEG" true)
        (lib.cmakeFeature "ECM_DIR" "${pkgs.kdePackages.extra-cmake-modules}/share/ECM/cmake")
      ];

      nativeBuildInputs = with pkgs; [
        cmake
        git
        kdePackages.extra-cmake-modules
        pkg-config
        strip-nondeterminism
        wrapQtAppsHook
        zip
      ];

      buildInputs = with pkgs; [
        sdl3
        cubeb
        curl
        ffmpeg
        libxrandr
        libaio
        libbacktrace
        libpcap
        libwebp
        lz4
        qtbase
        qtsvg
        qttools
        qtwayland
        shaderc
        soundtouch
        vulkan-headers
        vulkan-loader
        wayland
        zstd
        plutovg
        plutosvg
        kddockwidgets
        rapidyaml
        kdePackages.plasma-integration
      ];

      strictDeps = true;

      postInstall = ''
        install -Dm644 $src/pcsx2-qt/resources/icons/AppIcon64.png $out/share/icons/hicolor/64x64/apps/PCSX2.png
        install -Dm644 $src/.github/workflows/scripts/linux/pcsx2-qt.desktop $out/share/applications/PCSX2.desktop
        zip -jq $out/share/PCSX2/resources/patches.zip ${pcsx2Patches}/patches/*
        strip-nondeterminism $out/share/PCSX2/resources/patches.zip
      '';

      qtWrapperArgs = let
        libs = lib.makeLibraryPath [
          pkgs.vulkan-loader
          pkgs.shaderc
        ];
      in [
        "--prefix LD_LIBRARY_PATH : ${libs}"
        "--set-default QT_QPA_PLATFORMTHEME xdgdesktopportal"
      ];

      passthru = {
        inherit pcsx2Patches rapidyaml;
      };

      meta = commonMeta;
    });
  in {
    home.packages = [
      pcsx2Nightly
    ];
  };
}
