{
  self,
  lib,
  ...
}: {
  flake = let
    users = [
      "ratoncio"
    ];
  in {
    homeConfigurations = lib.mkMerge [
      (builtins.map (username: self.lib.mkHomeManager "x86_64-linux" "${username}") users)
    ];

    modules = lib.mkMerge (
      builtins.map (
        username: (lib.mkMerge [
          (self.factory.user "${username}" true)
          {
            nixos."${username}" = {
              users.users."${username}".initialHashedPassword = "$6$4jahjQj8GmEKllbZ$qDP2NqWQ3R4XzU8C66S8dWp1hGFW4QdSL1biKndyp.O31yvhvZWJbKYGEUwVfOa6UWYgWsjDPItsQNhbeTK3N1";
            };

            homeManager."${username}" = {pkgs, ...}: {
              imports = with self.modules.homeManager; [
                cli-nixvim
                cli-fish
                cli-htop
                cli-git
                cli-programming

                desktop-plasma
                desktop-xdg
                desktop-yt-dlp
                gaming-basic
              ];
              home.packages = with pkgs; [
              ];
            };
          }
        ])
      )
      users
    );
  };
}
