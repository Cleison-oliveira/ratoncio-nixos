{ ... }:
{
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set -g fish_greeting
      set fish_cursor_default block
    '';
  };
  home.shellAliases = {
    trim = "doas fstrim -v /";
    calc = "R --silent";
    ls = "ls --color=auto";
    diff = "diff --color=auto";
    grep = "grep --color=auto";
    gcc = "gcc -Wall -Werror -pedantic -std=c99";
  };
}
