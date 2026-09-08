{
  flake.modules.homeManager.gaming-rpcs3 = {
    pkgs,
    lib,
    ...
  }: let
    rpcs3Rev = "6d42df0f";
    rpcs3Version = "0.0.42-19703-6d42df0f";
    rpcs3Src = pkgs.fetchFromGitHub {
      owner = "RPCS3";
      repo = "rpcs3";
      rev = rpcs3Rev;
      fetchSubmodules = true;
      hash = "sha256-tkMVK+nY212XXj7dlWRSAmGHnpKP24MZRN1EVEm9T+M=";
    };
    inherit (pkgs.qt6) qtbase qtsvg qtwayland qtmultimedia wrapQtAppsHook;
    commonMeta = {
      homepage = "https://rpcs3.net";
      description = "PS3 emulator (build v${rpcs3Version})";
      changelog = "https://github.com/RPCS3/rpcs3/commit/${rpcs3Rev}";
      license = lib.licenses.gpl2Only;
      mainProgram = "rpcs3";
      platforms = ["x86_64-linux"];
    };
    rpcs3Latest = pkgs.llvmPackages.stdenv.mkDerivation (finalAttrs: {
      pname = "rpcs3";
      version = rpcs3Version;
      src = rpcs3Src;
      NIX_LDFLAGS = "-latomic";
      cmakeFlags = [
        (lib.cmakeBool "USE_SYSTEM_FFMPEG" true)
        (lib.cmakeBool "USE_SYSTEM_LIBUSB" true)
        (lib.cmakeBool "USE_SYSTEM_ZLIB" true)
        (lib.cmakeBool "USE_SYSTEM_CURL" true)
        (lib.cmakeBool "USE_SYSTEM_FAUDIO" true)
        (lib.cmakeBool "USE_SYSTEM_PUGIXML" true)
        (lib.cmakeBool "USE_SYSTEM_FLATBUFFERS" true)
        (lib.cmakeBool "USE_SYSTEM_PROTOBUF" true)
        (lib.cmakeBool "BUILD_SHARED_LIBS" false)
        (lib.cmakeBool "CMAKE_CXX_SCAN_FOR_MODULES" false)
        (lib.cmakeBool "USE_LTO" false)
      ];
      nativeBuildInputs = with pkgs; [
        cmake
        git
        ninja
        pkg-config
        protobuf
        wrapQtAppsHook
        bintools
        llvm
        lld
      ];
      buildInputs = with pkgs; [
        abseil-cpp
        curl
        faudio
        ffmpeg
        flatbuffers
        glew
        glslang
        libGL
        libevdev
        libpng
        libpulseaudio
        libusb1
        libX11
        openal
        protobuf
        pugixml
        qtbase
        qtmultimedia
        qtsvg
        qtwayland
        sdl3
        vulkan-headers
        vulkan-loader
        wayland
        zlib
        libsm
        libice
        libxext
        libxrender
        libxkbcommon
      ];
      strictDeps = true;
      postInstall = ''
        install -Dm644 $src/rpcs3/rpcs3.png $out/share/icons/hicolor/512x512/apps/rpcs3.png
        install -Dm644 $src/rpcs3/rpcs3.desktop $out/share/applications/rpcs3.desktop
      '';
      qtWrapperArgs = let
        libs = with pkgs;
          lib.makeLibraryPath [
            vulkan-loader
            libGL
            llvm
            wayland
            libxkbcommon
            libpulseaudio
            libx11
            libxrender
            libxext
            libsm
            libice
          ];
      in ["--prefix LD_LIBRARY_PATH : ${libs}"];
      meta = commonMeta;
    });
  in {
    home.packages = [
      rpcs3Latest
    ];
  };
}
