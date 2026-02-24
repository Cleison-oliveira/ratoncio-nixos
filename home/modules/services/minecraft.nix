{ pkgs, ... }:
{
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
      Install.WantedBy = [ "default.target" ];
    };

    bedrock-server = {
      Unit = {
        Description = "Minecraft Bedrock Server (Container)";
      };
      Service = {
        Restart = "always";
        RestartSec = "10s";

        Environment = "PATH=/run/wrappers/bin:/run/current-system/sw/bin";
        ExecStart = ''
          ${pkgs.podman}/bin/podman run --rm --replace --name bedrock-server \
          -p 19132:19132/udp \
          -v %h/bedrock-data:/data \
          -e EULA=TRUE \
          -e SERVER_NAME="Home Manager Bedrock" \
          -e GAMEMODE=survival \
          -e DIFFICULTY=hard \
          itzg/minecraft-bedrock-server
        '';
        ExecStop = "${pkgs.podman}/bin/podman stop bedrock-server";
      };
      Install.WantedBy = [ "default.target" ];
    };
  };
}
