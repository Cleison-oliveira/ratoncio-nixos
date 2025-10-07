{ config, lib, pkgs, ... }:

{

  programs.fish.enable = true;

  environment.systemPackages = with pkgs; [
<<<<<<< HEAD
<<<<<<< HEAD

=======
>>>>>>> 05c057b (A stable config)
=======
>>>>>>> master
    fishPlugins.done
    fishPlugins.fzf-fish
    fishPlugins.forgit
    fishPlugins.hydro
    fishPlugins.grc
    grc
<<<<<<< HEAD
<<<<<<< HEAD

=======
>>>>>>> 05c057b (A stable config)
=======
>>>>>>> master
  ];
}

