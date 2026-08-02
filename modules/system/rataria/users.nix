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
    homeConfigurations = lib.genAttrs users (username: self.lib.mkHomeManager "x86_64-linux" username);

    modules = lib.mkMerge (
      map
      (username:
        lib.mkMerge [
          (self.factory.user "${username}" true)
          {
            nixos."${username}" = {
              users.users."${username}".initialHashedPassword = "$6$4jahjQj8GmEKllbZ$qDP2NqWQ3R4XzU8C66S8dWp1hGFW4QdSL1biKndyp.O31yvhvZWJbKYGEUwVfOa6UWYgWsjDPItsQNhbeTK3N1";
            };

            homeManager."${username}" = {...}: {
              imports = with self.modules.homeManager; [
                desktop-plasma
                desktop-yt-dlp
                desktop-todavinci
                desktop-wasabi
                gaming-basic
                #gaming-minecraft-server
                gaming-steam

                services-flatpak

                system-cli
                system-default
                system-desktop
                system-minimal
              ];
              home.packages = [];
            };
          }
        ])
      users
    );
  };
}
