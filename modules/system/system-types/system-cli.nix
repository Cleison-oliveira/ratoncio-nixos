{inputs, ...}: {
  flake.modules.nixos.system-cli = {
    imports = with inputs.self.modules.nixos; [
      cli-bash
      cli-fish
      cli-mcp
    ];
  };

  flake.modules.homeManager.system-cli = {
    imports = with inputs.self.modules.homeManager; [
      cli-fish
      cli-git
      cli-htop
      cli-nixvim
      cli-programming
      cli-mcp
    ];
  };
}
