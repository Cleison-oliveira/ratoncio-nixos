{
  flake.modules.nixos.cli-fish = {
    programs.fish = {
      enable = true;
      vendor = {
        completions.enable = true;
        config.enable = true;
        functions.enable = true;
      };
    };
  };

  flake.modules.homeManager.cli-fish = {pkgs, ...}: {
    programs.fish = {
      enable = true;

      /*
        functions = {
        todavinci = {
          body = ''
            set name (string replace -r '\.[^.]+$' "" $argv[1])
            ffmpeg -i $argv[1] -c:v dnxhd -profile:v dnxhr_sq -pix_fmt yuv422p -c:a pcm_s16le "$name-resolve.mov"
          '';
        };
      };
      */

      shellAliases = {
        trim = "doas fstrim -v /";
        calc = "R --silent";
        diff = "diff --color=auto";
        grep = "rg --color=auto";
        gcc = "gcc -Wall -Werror -pedantic -std=c99";
        cat = "bat --style=plain --paging=never";
        la = "eza -a --color=always --group-directories-first --grid --icons";
        ls = "eza -al --color=always --group-directories-first --grid --icons";
        ll = "eza -l --color=always --group-directories-first --octal-permissions --icons";
        lt = "eza -aT --color=always --group-directories-first --icons";
        tree = "eza -T --all --icons --git-ignore";
      };

      interactiveShellInit = ''
        set -g fish_greeting
        set fish_cursor_default block

        fish_config prompt choose default
        set -g fish_color_normal F0F3F5
        set -g fish_color_command 61AFEF
        set -g fish_color_keyword C678DD
        set -g fish_color_error E85A66
        set -g fish_color_autosuggestion 7A7C7D
        set -g fish_color_param F0F3F5
        set -g fish_color_option 6BC47B
        set -g fish_color_comment 7A7C7D
        set -g fish_color_quote F2C55F
        set -g fish_color_redirection 6BC47B
        set -g fish_color_end 7A7C7D
        set -g fish_color_match --background=31363B --bold
        set -g fish_color_selection --background=31363B --bold
        set -g fish_color_search_match --background=31363B
        set -g fish_color_pager_selected --background=31363B --bold
        set -g fish_color_valid_path --underline
      '';
    };

    home.packages = with pkgs; [
      fishPlugins.done
      fishPlugins.fzf-fish
      fishPlugins.forgit
      fishPlugins.hydro
      fishPlugins.grc
      grc
    ];

    programs.nix-index.enableFishIntegration = true;
    programs = {
      bat.enable = true;
      fzf.enable = true;
      fd.enable = true;
      direnv = {
        enable = true;
        nix-direnv.enable = true;
      };
    };
  };
}
