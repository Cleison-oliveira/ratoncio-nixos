{inputs, ...}: {
  flake.modules.nixos.system-desktop = {
    imports = with inputs.self.modules.nixos; [
      desktop-xdg
    ];
  };
  flake.modules.homeManager.system-desktop = {
    imports = with inputs.self.modules.homeManager; [
      desktop-wlr
      desktop-xdg
      desktop-vscodium
    ];
  };
}
