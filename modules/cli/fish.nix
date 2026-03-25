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

  flake.modules.homeManager.cli-fish = {...}: {
    programs.fish = {
      enable = true;
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
      '';
    };
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
