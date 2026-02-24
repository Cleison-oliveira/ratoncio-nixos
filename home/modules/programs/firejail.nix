{ ... }:
let
  baseProfile = ''
    caps.drop all
    nogroups
    env LANG=en_US.UTF-8
    env LC_ALL=en_US.UTF-8
    private ''${HOME}
  '';
in
{
  home = {
    file.".firejail/telegram.profile".text = ''
      ${baseProfile}
      seccomp
    '';
    file.".firejail/base.profile".text = ''
      ${baseProfile}
    '';
  };
}
