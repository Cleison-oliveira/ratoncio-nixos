{
  flake.modules.nixos.desktop-ollama = {pkgs, ...}: {
    services = {
      open-webui = {
        enable = false;
        port = 8080;
        environment = {
          OLLAMA_API_BASE_URL = "http://127.0.0.1:11434";
          WEBUI_AUTH = "True";
        };
      };
      ollama = {
        enable = true;
        package = pkgs.ollama-cuda;
        loadModels = ["qwen3.5:27b" "gemma4:e4b" "codestral:22b"];
        environmentVariables = {
          OLLAMA_MAX_MODELS = "1";
          OLLAMA_KEEP_ALIVE = "5m";
        };
      };
      tailscale.enable = true;
    };
  };
}
