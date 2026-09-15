{
  flake.modules.homeManager.gaming-lsfg-vk = {
    pkgs,
    lib,
    ...
  }: let
    lsfgVersion = "2.0.0";

    lsfgSrc = pkgs.fetchurl {
      url = "https://git.lsfg-vk.dev/lsfg-vk/snapshot/lsfg-vk-${lsfgVersion}.tar.xz";
      hash = "sha256-q7aI/qwA1Q+eWdq7JHaZi8HT8CkPuXFAfUnLom3USzs=";
    };

    commonMeta = {
      homepage = "https://codeberg.org/PancakeTAS/lsfg-vk";
      changelog = "https://git.lsfg-vk.dev/lsfg-vk/tag/?h=${lsfgVersion}";
      license = lib.licenses.mit;
      platforms = ["x86_64-linux"];
    };

    lsfgVk = pkgs.llvmPackages.stdenv.mkDerivation {
      pname = "lsfg-vk";
      version = lsfgVersion;
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
        "-DLSFGVK_BUILD_LAYER=ON"
        "-DLSFGVK_BUILD_CLI=ON"
        "-DLSFGVK_BUILD_UI=OFF"
        "-DLSFGVK_MANAGED=ON"
      ];

      preConfigure = ''
        cmakeFlagsArray+=("-DLSFGVK_LAYER_LIBRARY_PATH=$out/lib/liblsfg-vk-layer.so")
      '';

      meta =
        commonMeta
        // {
          description = "Vulkan layer + CLI for frame generation";
          mainProgram = "lsfg-vk-cli";
        };
    };

    lsfgVkUi = pkgs.llvmPackages.stdenv.mkDerivation {
      pname = "lsfg-vk-ui";
      version = lsfgVersion;
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
        "-DLSFGVK_BUILD_LAYER=OFF"
        "-DLSFGVK_BUILD_CLI=OFF"
        "-DLSFGVK_BUILD_UI=ON"
        "-DLSFGVK_MANAGED=ON"
      ];

      meta =
        commonMeta
        // {
          description = "Graphical configuration interface for lsfg-vk";
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
