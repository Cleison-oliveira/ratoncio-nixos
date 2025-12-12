{ ... }:
let 
  modules = import ./modules.nix;
in {
  programs = {
    waybar = {
      enable = true;
      style = import ./style.nix;
      settings = {
        dp-3 = {
          output = "DP-3";
          exclusive = true;
          passtrough = false;
          ipc = true;
          gtk-layer-shell = true;
          layer = "top";
          position = "top";
        } // modules;

        dp-2 = {
          output = "DP-2";
          exclusive = true;
          passtrough = false;
          ipc = true;
          gtk-layer-shell = true;
          layer = "top";
          position = "top";
        } // modules;
      };
    };
  };
}
