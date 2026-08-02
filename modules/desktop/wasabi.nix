{
  flake.modules.homeManager.desktop-wasabi = {
    pkgs,
    lib,
    ...
  }: let
    pname = "wasabiwallet";
    version = "2.8.1";

    src = pkgs.fetchurl {
      url = "https://github.com/WalletWasabi/WalletWasabi/releases/download/v${version}/Wasabi-${version}-linux-x64.tar.gz";
      sha256 = "1694eeba35c022d0aa9143e2d50cc938497446a4c4c8aaa5b80353741c420b77";
    };

    icon = pkgs.fetchurl {
      url = "https://raw.githubusercontent.com/WalletWasabi/WalletWasabi/master/WalletWasabi.Fluent/Assets/WasabiLogo.ico";
      sha256 = "7aaef8a24fa70e98d3e277a22cd29ddb05058a6957fae0d0330778ee6f683445";
    };

    runtimeLibs = with pkgs; [
      fontconfig.lib
      openssl
      (lib.getLib stdenv.cc.cc)
      libx11
      libice
      libsm
      zlib
    ];

    desktopItem = pkgs.makeDesktopItem {
      name = "wasabi";
      exec = "wasabiwallet-desktop";
      icon = pname;
      desktopName = "Wasabi";
      genericName = "Bitcoin wallet";
      comment = "Privacy focused Bitcoin wallet";
      categories = ["Network" "Utility"];
    };

    wasabiwallet = pkgs.stdenv.mkDerivation {
      inherit pname version src desktopItem; # <- desktopItem precisa estar aqui pra virar $desktopItem no builder

      dontBuild = true;

      nativeBuildInputs = with pkgs; [
        autoPatchelfHook
        makeWrapper
        imagemagick
      ];

      buildInputs = runtimeLibs ++ [pkgs.lttng-ust_2_12];

      installPhase = ''
        runHook preInstall

        mkdir -p $out/opt/${pname} $out/bin $out/share/applications

        cp -Rv ./* $out/opt/${pname}

        for nameMap in "wassabee:desktop" "wassabeed:daemon" "wcoordinator:coordinator"; do
          IFS=":" read -r filename wrappedname <<< "$nameMap"
          makeWrapper "$out/opt/${pname}/$filename" "$out/bin/${pname}-$wrappedname" \
            --suffix "LD_LIBRARY_PATH" : "${pkgs.lib.makeLibraryPath runtimeLibs}"
        done

        cp -v $desktopItem/share/applications/* $out/share/applications

        for size in 16 24 32 48 64 128 256; do
          mkdir -p $out/share/icons/hicolor/''${size}x''${size}/apps
          convert "${icon}" -resize ''${size}x''${size} \
            "$out/share/icons/hicolor/''${size}x''${size}/apps/${pname}.png"
        done

        runHook postInstall
      '';

      meta = {
        description = "Privacy focused Bitcoin wallet";
        homepage = "https://wasabiwallet.io/";
        sourceProvenance = with lib.sourceTypes; [binaryNativeCode];
        license = lib.licenses.mit;
        platforms = ["x86_64-linux"];
      };
    };
  in {
    home.packages = [wasabiwallet];
  };
}
