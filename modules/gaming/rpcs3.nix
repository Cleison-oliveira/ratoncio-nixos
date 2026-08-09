{
  flake.modules.homeManager.gaming-rpcs3 = {
    pkgs,
    lib,
    ...
  }: let
    rpcs3Rev = "HEAD";
    rpcs3Version = "0.0.35-latest";

    rpcs3Src = pkgs.fetchFromGitHub {
      owner = "RPCS3";
      repo = "rpcs3";
      rev = rpcs3Rev;
      fetchSubmodules = true;
      hash = lib.fakeHash;
    };

    inherit (pkgs.qt6) qtbase qtsvg qtwayland qtmultimedia wrapQtAppsHook;

    commonMeta = {
      homepage = "https://rpcs3.net";
      description = "PS3 emulator and debugger (compilado do master via wrapper)";
      changelog = "https://github.com/RPCS3/rpcs3/commits/master";
      license = lib.licenses.gpl2Only;
      mainProgram = "rpcs3";
      platforms = ["x86_64-linux"];
    };

    rpcs3Latest = pkgs.llvmPackages.stdenv.mkDerivation (finalAttrs: {
      pname = "rpcs3-latest";
      version = rpcs3Version;
      src = rpcs3Src;

      cmakeFlags = [
        (lib.cmakeBool "USE_SYSTEM_FFMPEG" true)
        (lib.cmakeBool "USE_SYSTEM_LIBUSB" true)
        (lib.cmakeBool "USE_SYSTEM_ZLIB" true)
        (lib.cmakeBool "USE_SYSTEM_CURL" true)
        (lib.cmakeBool "USE_SYSTEM_FAUDIO" true)
        (lib.cmakeBool "USE_SYSTEM_PUGIXML" true)
        (lib.cmakeBool "USE_SYSTEM_FLATBUFFERS" true)
        (lib.cmakeBool "BUILD_SHARED_LIBS" false)
      ];

      nativeBuildInputs = with pkgs; [
        cmake
        pkg-config
        wrapQtAppsHook
      ];

      buildInputs = with pkgs; [
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
        pugixml
        qtbase
        qtmultimedia
        qtsvg
        qtwayland
        sdl2
        vulkan-headers
        vulkan-loader
        wayland
        zlib
      ];

      strictDeps = true;

      postInstall = ''
        install -Dm644 $src/rpcs3/rpcs3.png $out/share/icons/hicolor/512x512/apps/rpcs3.png
        install -Dm644 $src/rpcs3.desktop $out/share/applications/rpcs3.desktop
      '';

      qtWrapperArgs = let
        libs = lib.makeLibraryPath [
          pkgs.vulkan-loader
          pkgs.libGL
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
