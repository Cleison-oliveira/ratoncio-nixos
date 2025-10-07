{ config, lib, pkgs, ... }:

{

  programs.fish.enable = true;

  environment.systemPackages = with pkgs; [
<<<<<<< HEAD

=======
>>>>>>> 05c057b (A stable config)
    fishPlugins.done
    fishPlugins.fzf-fish
    fishPlugins.forgit
    fishPlugins.hydro
    fishPlugins.grc
    grc
<<<<<<< HEAD

=======
>>>>>>> 05c057b (A stable config)
  ];
}

