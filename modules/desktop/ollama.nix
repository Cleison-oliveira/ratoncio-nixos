{
  flake.modules.nixos.desktop-ollama = {pkgs, ...}: {
    services = {
      open-webui = {
        enable = true;
        port = 8080;
        environment = {
          OLLAMA_API_BASE_URL = "http://127.0.0.1:11434";
          WEBUI_AUTH = "True";
        };
      };
      ollama = {
        enable = true;
        package = pkgs.ollama-cuda;
        loadModels = ["qwen3.5:27b" "gemma3:27b" "qwen3.5:27b"];
        environmentVariables = {
          OLLAMA_MAX_MODELS = "1";
          OLLAMA_KEEP_ALIVE = "5m";
        };
      };
      tailscale.enable = true;
    };
    systemd.services.tailscale-funnel = {
      description = "Tailscale Funnel";
      after = ["network-online.target" "tailscaled.service"];
      wants = ["network-online.target" "tailscaled.service"];
      wantedBy = ["multi-user.target"];
      serviceConfig = {
        ExecStart = "${pkgs.tailscale}/bin/tailscale funnel 8080";
        Restart = "always";
        RestartSec = "10s";
      };
    };
  };
}
