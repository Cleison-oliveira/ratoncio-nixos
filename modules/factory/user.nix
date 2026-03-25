{self, ...}: {
  config.flake.factory.user = username: isAdmin: {
    nixos."${username}" = {
      lib,
      pkgs,
      ...
    }: {
      users.users."${username}" = {
        isNormalUser = true;
        home = "/home/${username}";
        shell = pkgs.fish;
        extraGroups =
          lib.optionals isAdmin [
            "wheel"
          ]
          ++ [
            "networkmanager"
            "allowusers"
            "libvirtd"
            "docker"
            "gamemode"
            "kvm"
            "input"
            "audio"
            "render"
            "video"
            "scanner"
            "lp"
            "i2c"
          ];
      };

      security.doas.extraRules = [
        {
          users = ["${username}"];
          keepEnv = true;
          persist = true;
        }
      ];

      programs.fish.enable = true;
      environment.systemPackages = with pkgs; [
        fishPlugins.done
        fishPlugins.fzf-fish
        fishPlugins.forgit
        fishPlugins.hydro
        fishPlugins.grc
        grc
      ];

      home-manager.users."${username}" = {
        imports = [
          self.modules.homeManager."${username}"
        ];
      };
    };

    homeManager."${username}" = {
      home.username = "${username}";
      programs.home-manager.enable = true;
    };
  };
}
