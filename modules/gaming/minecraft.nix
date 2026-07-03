{
  flake.modules.homeManager.gaming-minecraft-server = {pkgs, ...}: {
    systemd.user.services = {
      playit = {
        Unit = {
          Description = "Playit.gg Tunnel";
        };
        Service = {
          Restart = "always";
          RestartSec = "10s";

          EnvironmentFile = "%h/.playit-secret";
          Environment = "PATH=/run/wrappers/bin:/run/current-system/sw/bin:/usr/bin:/bin";

          ExecStartPre = [
            "${pkgs.podman}/bin/podman pull ghcr.io/playit-cloud/playit-agent:latest"
          ];

          ExecStart = ''
            ${pkgs.podman}/bin/podman run \
            --name playit \
            --network host \
            --replace \
            --rm \
            --env-file %h/.playit-secret \
            ghcr.io/playit-cloud/playit-agent:latest
          '';
          ExecStop = "${pkgs.podman}/bin/podman stop playit";
        };
        Install.WantedBy = ["default.target"];
      };

      minecraft-java-server = {
        Unit = {
          Description = "Minecraft Java Server (Container)";
        };
        Service = {
          Restart = "always";
          RestartSec = "10s";
          Environment = "PATH=/run/wrappers/bin:/run/current-system/sw/bin";

          ExecStartPre = [
            "${pkgs.coreutils}/bin/mkdir -p %h/minecraft-java-data"
          ];
          ExecStart = ''
            ${pkgs.podman}/bin/podman run --rm --replace --name minecraft-java-server \
            --userns=keep-id \
            -p 25565:25565 \
            -v %h/minecraft-java-data:/data \
            -e EULA=TRUE \
            -e MOTD=Servidor-Java-NixOS \
            -e DIFFICULTY=hard \
            -e MEMORY=8G \
            -e TYPE=PAPER \
            -e VERSION=26.1.2 \
            -e UID=%U \
            -e GID=%G \
            itzg/minecraft-server
          '';
          ExecStop = "${pkgs.podman}/bin/podman stop minecraft-java-server";
        };
        Install.WantedBy = ["default.target"];
      };
    };
  };
}
