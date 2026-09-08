{
  flake.modules.homeManager.desktop-dte = {
    pkgs,
    lib,
    ...
  }: let
    dteRev = "1.8.0";
    dteVersion = "1.8.0";

    dte = pkgs.stdenv.mkDerivation rec {
      pname = "dolphin-texture-extraction-tool";
      version = dteVersion;

      src = pkgs.fetchurl {
        url = "https://github.com/Venomalia/DolphinTextureExtraction-tool/releases/download/${version}/linux-x64.zip";
        sha256 = "sha256-/6aUzD3lkiDrbtD/BWjEQ9pG3MN0r/3UcsnInW6p54w=";
      };

      nativeBuildInputs = with pkgs; [
        unzip
        autoPatchelfHook
        makeWrapper
      ];

      buildInputs = with pkgs; [
        stdenv.cc.cc.lib
        libx11
        libxi
        libxcursor
        libxrandr
        libxxf86vm
        libxinerama
        libGL
        zlib
        openssl
        fontconfig
        freetype
        curl
        libssh2
        lttng-ust
        krb5
        keyutils
        libunwind
        libuuid
        util-linux
        dotnetCorePackages.runtime_8_0
      ];

      unpackPhase = ''
        runHook preUnpack
        unzip -q $src -d dte-unpacked
        sourceRoot=dte-unpacked
        runHook postUnpack
      '';

      installPhase = ''
        runHook preInstall
        mkdir -p $out/lib/dte
        mkdir -p $out/bin

        cp -r ./* $out/lib/dte/

        chmod +x $out/lib/dte/libglfw.so.3.3
        chmod +x $out/lib/dte/libnironcompress.so

        DOTNET_RUNTIME=${pkgs.dotnetCorePackages.runtime_8_0}

        # Patch runtimeconfig.json to allow rolling forward from net6.0 to .NET 8.0
        cat > $out/lib/dte/DolphinTextureExtraction.tool.runtimeconfig.json << RUNTIMECONFIG
        {
          "runtimeOptions": {
            "tfm": "net6.0",
            "rollForward": "LatestMajor",
            "framework": {
              "name": "Microsoft.NETCore.App",
              "version": "6.0.0"
            },
            "configProperties": {
              "System.Reflection.Metadata.MetadataUpdater.IsSupported": false
            }
          }
        }
        RUNTIMECONFIG

        makeWrapper "$DOTNET_RUNTIME/bin/dotnet" $out/bin/dte \
          --add-flags "$out/lib/dte/DolphinTextureExtraction.tool.dll" \
          --set DOTNET_ROLL_FORWARD "LatestMajor" \
          --prefix LD_LIBRARY_PATH : "$out/lib/dte" \
          --prefix LD_LIBRARY_PATH : "$DOTNET_RUNTIME/lib"

        ln -s $out/bin/dte $out/bin/DolphinTextureExtraction.tool

        runHook postInstall
      '';

      dontBuild = true;
      dontConfigure = true;
      doCheck = false;

      meta = with lib; {
        homepage = "https://github.com/Venomalia/DolphinTextureExtraction-tool";
        description = "Dumps GC/Wii textures compatible with Dolphin texture hash (v${version})";
        changelog = "https://github.com/Venomalia/DolphinTextureExtraction-tool/releases/tag/${dteRev}";
        license = licenses.mit;
        mainProgram = "dte";
        platforms = ["x86_64-linux"];
      };
    };
  in {
    home.packages = [
      dte
    ];
  };
}
