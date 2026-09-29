{
  flake.modules.nixos.cli-mcp = {
    pkgs,
    ...
  }: let
    mcpNixosWrapped = pkgs.symlinkJoin {
      name = "mcp-nixos-wrapped";
      paths = [pkgs.mcp-nixos];
      buildInputs = [pkgs.makeWrapper];
      postBuild = ''
        wrapProgram $out/bin/mcp-nixos \
          --set-default FASTMCP_SHOW_SERVER_BANNER "false" \
          --set-default FASTMCP_CHECK_FOR_UPDATES "off" \
          --set-default FASTMCP_LOG_LEVEL "WARNING"
      '';
    };
  in {
    environment.systemPackages = [
      mcpNixosWrapped
      (pkgs.writeShellScriptBin "mcp-nixos-http" ''
        export MCP_NIXOS_TRANSPORT=http
        export MCP_NIXOS_HOST=''${MCP_NIXOS_HOST:-127.0.0.1}
        export MCP_NIXOS_PORT=''${MCP_NIXOS_PORT:-8000}
        export MCP_NIXOS_PATH=''${MCP_NIXOS_PATH:-/mcp}
        echo "Starting MCP-NixOS HTTP server at http://$MCP_NIXOS_HOST:$MCP_NIXOS_PORT$MCP_NIXOS_PATH ..."
        exec ${mcpNixosWrapped}/bin/mcp-nixos "$@"
      '')
    ];
  };

  flake.modules.homeManager.cli-mcp = {
    pkgs,
    ...
  }: let
    mcpNixosWrapped = pkgs.symlinkJoin {
      name = "mcp-nixos-wrapped";
      paths = [pkgs.mcp-nixos];
      buildInputs = [pkgs.makeWrapper];
      postBuild = ''
        wrapProgram $out/bin/mcp-nixos \
          --set-default FASTMCP_SHOW_SERVER_BANNER "false" \
          --set-default FASTMCP_CHECK_FOR_UPDATES "off" \
          --set-default FASTMCP_LOG_LEVEL "WARNING"
      '';
    };
  in {
    home.packages = [
      mcpNixosWrapped
      (pkgs.writeShellScriptBin "mcp-nixos-http" ''
        export MCP_NIXOS_TRANSPORT=http
        export MCP_NIXOS_HOST=''${MCP_NIXOS_HOST:-127.0.0.1}
        export MCP_NIXOS_PORT=''${MCP_NIXOS_PORT:-8000}
        export MCP_NIXOS_PATH=''${MCP_NIXOS_PATH:-/mcp}
        echo "Starting MCP-NixOS HTTP server at http://$MCP_NIXOS_HOST:$MCP_NIXOS_PORT$MCP_NIXOS_PATH ..."
        exec ${mcpNixosWrapped}/bin/mcp-nixos "$@"
      '')
    ];

    home.file.".gemini/config/mcp_config.json".text = builtins.toJSON {
      mcpServers = {
        nixos = {
          command = "${mcpNixosWrapped}/bin/mcp-nixos";
          args = [];
          env = {
            FASTMCP_SHOW_SERVER_BANNER = "false";
            FASTMCP_CHECK_FOR_UPDATES = "off";
            FASTMCP_LOG_LEVEL = "WARNING";
          };
        };
      };
    };
  };
}
