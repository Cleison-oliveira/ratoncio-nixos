{
  flake.modules.homeManager.gaming-lsfgvk = {
    pkgs,
    lib,
    ...
  }: let
    lsfgRev = "218820e8dc2d69c21a7a0775b5c47f2c447ed31a";
    lsfgDevVersion = "2.0.0-dev26+${builtins.substring 0 7 lsfgRev}";

    lsfgSrc = pkgs.fetchFromGitHub {
      owner = "PancakeTAS";
      repo = "lsfg-vk";
      rev = lsfgRev;
      fetchSubmodules = true;
      hash = "sha256-Qb3vufCzNpM1r+vgo8M9nnA7CENgGTithWG0oXqLKbI=";
    };

    commonMeta = {
      homepage = "https://github.com/PancakeTAS/lsfg-vk/";
      changelog = "https://github.com/PancakeTAS/lsfg-vk/commit/${lsfgRev}";
      license = lib.licenses.mit;
      platforms = ["x86_64-linux"];
    };

    lsfgVk = pkgs.llvmPackages.stdenv.mkDerivation {
      pname = "lsfg-vk";
      version = lsfgDevVersion;
      src = lsfgSrc;

      nativeBuildInputs = with pkgs; [
        cmake
        ninja
        pkg-config
      ];

      buildInputs = with pkgs; [
        vulkan-headers
        vulkan-loader
      ];

      cmakeFlags = [
        "-DCMAKE_BUILD_TYPE=Release"
        "-DLSFGVK_BUILD_VK_LAYER=ON"
        "-DLSFGVK_BUILD_CLI=ON"
        "-DLSFGVK_BUILD_UI=OFF"
        "-DLSFGVK_INSTALL_XDG_FILES=OFF"
      ];

      preConfigure = ''
        cmakeFlagsArray+=("-DLSFGVK_LAYER_LIBRARY_PATH=$out/lib/liblsfg-vk-layer.so")
      '';

      meta =
        commonMeta
        // {
          description = "Vulkan layer + CLI for frame generation (dev/2.0.0 pré-release, via wrapper)";
          mainProgram = "lsfg-vk-cli";
        };
    };

    lsfgVkUi = pkgs.llvmPackages.stdenv.mkDerivation {
      pname = "lsfg-vk-ui";
      version = lsfgDevVersion;
      src = lsfgSrc;

      nativeBuildInputs = with pkgs; [
        cmake
        ninja
        pkg-config
        qt6.wrapQtAppsHook
      ];

      buildInputs = with pkgs; [
        vulkan-headers
        vulkan-loader
        qt6.qtbase
        qt6.qtdeclarative
      ];

      cmakeFlags = [
        "-DCMAKE_BUILD_TYPE=Release"
        "-DLSFGVK_BUILD_VK_LAYER=OFF"
        "-DLSFGVK_BUILD_CLI=OFF"
        "-DLSFGVK_BUILD_UI=ON"
        "-DLSFGVK_INSTALL_XDG_FILES=ON"
      ];

      meta =
        commonMeta
        // {
          description = "Graphical configuration interface for lsfg-vk (dev/2.0.0 pré-release, via wrapper)";
          mainProgram = "lsfg-vk-ui";
        };
    };
  in {
    home.packages = [
      lsfgVk
      lsfgVkUi
    ];
  };
}
