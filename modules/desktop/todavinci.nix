{
  flake.modules.homeManager.desktop-todavinci = {pkgs, ...}: {
    home.packages = with pkgs; [
      (writeShellScriptBin "todavinci" ''
        if [ -z "$1" ]; then
            echo "Error: No file provided."
            echo "Usage: todavinci <video_file>"
            exit 1
        fi

        INPUT="$1"
        NAME="''${INPUT%.*}"
        OUTPUT="''${NAME}-resolve.mov"

        echo "Converting '$INPUT' to '$OUTPUT'..."

        ${ffmpeg}/bin/ffmpeg -i "$INPUT" \
            -c:v dnxhd \
            -profile:v dnxhr_sq \
            -pix_fmt yuv422p \
            -c:a pcm_s16le \
            "$OUTPUT"
      '')
    ];
  };
}
