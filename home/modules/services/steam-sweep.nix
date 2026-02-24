{ config, pkgs, ... }: {
  systemd.user.paths.steam-sweep = {
    Unit = {
      Description = "Monitor creation of Steam desktop shortcuts";
    };
    Install = {
      WantedBy = [ "default.target" ];
    };
    Path = {
      PathChanged = "${config.home.homeDirectory}/.local/share/applications";
    };
  };

  systemd.user.services.steam-sweep = {
    Unit = {
      Description = "Remove Steam game .desktop shortcuts";
    };
    Service = {
      Type = "oneshot";
    ExecStart = "${pkgs.findutils}/bin/find ${config.home.homeDirectory}/.local/share/applications/ -type f -name '*.desktop' -exec ${pkgs.gnugrep}/bin/grep -l 'Exec=steam steam://rungameid/' {} \\; -delete";
  };
};
}
