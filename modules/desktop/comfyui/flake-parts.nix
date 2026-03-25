{inputs, ...}: {
  flake-file.inputs.comfyui-nix = {
    url = "github:utensils/comfyui-nix";
  };
  flake.modules.homeManager.comfyui-nix = {
    imports = [
      inputs.comfyui-nix.nixosModules.default
    ];
  };
}
