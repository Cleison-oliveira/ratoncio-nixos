{
  flake.modules.homeManager.desktop-upscaler = {pkgs, ...}: {
    home.packages = with pkgs; [
      (writeShellScriptBin "upscale" ''
        set -euo pipefail

        usage() {
          cat <<'EOF'
        Anime Alpha-Preserving Image Upscaler (Real-ESRGAN + ImageMagick)

        Usage:
          upscale [options] <image.png>
          upscale [options] -i <directory>

        Options:
          -i PATH     Input PNG file or directory
          -o DIR      Output directory (default: ./upscaled)
          -s SCALE    Scale factor: 2, 3, or 4 (default: 4)
          -n MODEL    Model name (default: realesrgan-x4plus-anime)
          -a MODE     Alpha upscaling mode: 'ai' (crisp edges, default) or 'lanczos' (faster)
          -g GPU_ID   Vulkan GPU device ID (auto-detected if omitted)
          -r          Recursively process subdirectories when input is a directory
          -h          Show this help message

        Examples:
          upscale character.png
          upscale -i ./sprites -o ./upscaled_sprites
          upscale -i ./textures -r -s 4 -a ai
        EOF
        }

        INPUT_PATH=""
        OUT_DIR="./upscaled"
        MODEL="realesrgan-x4plus-anime"
        SCALE=4
        ALPHA_MODE="ai"
        GPU_ID=""
        RECURSIVE=0

        while getopts "i:o:s:n:a:g:rh" opt; do
          case "$opt" in
            i) INPUT_PATH="$OPTARG" ;;
            o) OUT_DIR="$OPTARG" ;;
            s) SCALE="$OPTARG" ;;
            n) MODEL="$OPTARG" ;;
            a) ALPHA_MODE="$OPTARG" ;;
            g) GPU_ID="$OPTARG" ;;
            r) RECURSIVE=1 ;;
            h) usage; exit 0 ;;
            *) usage; exit 1 ;;
          esac
        done
        shift $((OPTIND - 1))

        if [ -z "$INPUT_PATH" ] && [ $# -gt 0 ]; then
          INPUT_PATH="$1"
        fi

        if [ -z "$INPUT_PATH" ]; then
          usage
          exit 1
        fi

        TMP_DIR="$(mktemp -d)"
        trap 'rm -rf "$TMP_DIR"' EXIT

        # Auto-detect best discrete GPU if not explicitly provided
        if [ -z "$GPU_ID" ]; then
          PROBE_IMG="$TMP_DIR/probe.png"
          ${imagemagick}/bin/magick -size 64x64 xc:white "$PROBE_IMG" 2>/dev/null || true
          PROBE_LOG="$TMP_DIR/gpu_probe.log"
          ${realesrgan-ncnn-vulkan}/bin/realesrgan-ncnn-vulkan -i "$PROBE_IMG" -o "$TMP_DIR/probe_out.png" -n "$MODEL" -s 2 -g 0 2>"$PROBE_LOG" 1>/dev/null || true

          BEST_GPU=""
          BEST_SCORE=0
          while IFS= read -r line; do
            if [[ "$line" =~ ^\[([0-9]+)[[:space:]]+([^]]+)\] ]]; then
              dev_id="''${BASH_REMATCH[1]}"
              dev_name="''${BASH_REMATCH[2]}"
              score=10
              case "$dev_name" in
                *NVIDIA*|*GeForce*|*RTX*|*GTX*) score=100 ;;
                *RADV*|*Radeon*|*AMD*)
                  case "$dev_name" in
                    *RX*|*Discrete*) score=80 ;;
                    *) score=30 ;;
                  esac
                  ;;
                *Intel*) score=20 ;;
                *llvmpipe*) score=1 ;;
              esac
              if [ "$score" -gt "$BEST_SCORE" ]; then
                BEST_SCORE=$score
                BEST_GPU=$dev_id
              fi
            fi
          done < <(grep '^\[' "$PROBE_LOG" 2>/dev/null | sort -u || true)

          GPU_ID="''${BEST_GPU:-0}"
        fi

        upscale_ai() {
          local in_file="$1"
          local out_file="$2"
          ${realesrgan-ncnn-vulkan}/bin/realesrgan-ncnn-vulkan -i "$in_file" -o "$out_file" -n "$MODEL" -s "$SCALE" -g "$GPU_ID" 2>/dev/null
        }

        upscale_lanczos() {
          local in_file="$1"
          local out_file="$2"
          ${imagemagick}/bin/magick "$in_file" -filter Lanczos -resize "$SCALE"00% "$out_file" 2>/dev/null
        }

        process_file() {
          local src="$1"
          local filename
          filename="$(basename "$src")"
          local stem="''${filename%.*}"

          if [ ! -f "$src" ]; then
            echo "[-] File not found: $src" >&2
            return 1
          fi

          local target_dir="$OUT_DIR"
          if [ -d "$INPUT_PATH" ] && [ "$RECURSIVE" -eq 1 ]; then
            local base_dir="''${INPUT_PATH%/}"
            local file_dir
            file_dir="$(dirname "$src")"
            local rel_dir="''${file_dir#"$base_dir"}"
            rel_dir="''${rel_dir#/}"
            if [ -n "$rel_dir" ]; then
              target_dir="$OUT_DIR/$rel_dir"
            fi
          fi
          mkdir -p "$target_dir"
          local dest="$target_dir/''${stem}.png"

          local dims
          dims=$(${imagemagick}/bin/magick identify -format "%wx%h" "$src" 2>/dev/null || echo "")
          if [ -z "$dims" ]; then
            echo "[-] Invalid image: $src" >&2
            return 1
          fi

          echo "==> [$stem] ($dims) -> Scale: ''${SCALE}x | Alpha: $ALPHA_MODE | GPU: $GPU_ID"

          local rgb_in="$TMP_DIR/''${stem}_rgb_in.png"
          local rgb_out="$TMP_DIR/''${stem}_rgb_out.png"
          local alpha_in="$TMP_DIR/''${stem}_alpha_in.png"
          local alpha_out="$TMP_DIR/''${stem}_alpha_out.png"

          # 1. Split RGB and Alpha without background blending
          ${imagemagick}/bin/magick "$src" -alpha off -colorspace sRGB -depth 8 PNG24:"$rgb_in"
          ${imagemagick}/bin/magick "$src" -alpha extract -colorspace gray -depth 8 "$alpha_in"

          # 2. Upscale RGB with AI model (fallback to Lanczos if AI fails)
          if ! upscale_ai "$rgb_in" "$rgb_out"; then
            echo "    [!] AI upscale failed for RGB, falling back to Lanczos"
            upscale_lanczos "$rgb_in" "$rgb_out"
          fi

          # 3. Upscale Alpha channel
          if [ "$ALPHA_MODE" = "ai" ]; then
            local alpha_rgb_in="$TMP_DIR/''${stem}_alpha_rgb_in.png"
            local alpha_rgb_out="$TMP_DIR/''${stem}_alpha_rgb_out.png"
            ${imagemagick}/bin/magick "$alpha_in" -type TrueColor "$alpha_rgb_in"
            if upscale_ai "$alpha_rgb_in" "$alpha_rgb_out"; then
              ${imagemagick}/bin/magick "$alpha_rgb_out" -colorspace Gray "$alpha_out"
            else
              echo "    [!] AI upscale failed for Alpha, falling back to Lanczos"
              upscale_lanczos "$alpha_in" "$alpha_out"
            fi
          else
            upscale_lanczos "$alpha_in" "$alpha_out"
          fi

          # 4. Recomposite upscaled RGB and Alpha
          ${imagemagick}/bin/magick "$rgb_out" "$alpha_out" -alpha off -compose CopyOpacity -composite "$dest"

          # Cleanup temporary files for this image
          rm -f "$rgb_in" "$rgb_out" "$alpha_in" "$alpha_out" "$TMP_DIR/''${stem}"_* 2>/dev/null || true

          echo "    [+] Done: $dest"
        }

        mkdir -p "$OUT_DIR"

        if [ -d "$INPUT_PATH" ]; then
          echo "[*] Processing directory: $INPUT_PATH (recursive: $RECURSIVE, model: $MODEL, GPU: $GPU_ID)"
          find_args=("$INPUT_PATH")
          if [ "$RECURSIVE" -eq 0 ]; then
            find_args+=("-maxdepth" "1")
          fi
          find "''${find_args[@]}" -type f \( -iname "*.png" \) -print0 | while IFS= read -r -d "" file; do
            process_file "$file"
          done
        elif [ -f "$INPUT_PATH" ]; then
          process_file "$INPUT_PATH"
        else
          echo "[-] Error: Invalid input '$INPUT_PATH' (must be a PNG file or directory)" >&2
          exit 1
        fi

        echo "[*] Completed successfully."
      '')
    ];
  };
}
