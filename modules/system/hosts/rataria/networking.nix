{
  flake.modules.nixos.rataria = {pkgs, ...}: {
    networking = {
      networkmanager = {
        enable = true;
        ensureProfiles.profiles = {
          "eno1-static" = {
            connection = {
              id = "eno1-static";
              type = "ethernet";
              interface-name = "eno1";
            };
            ipv4 = {
              method = "manual";
              address1 = "192.168.1.10/24,192.168.1.1";
              dns = "1.1.1.1;8.8.8.8;";
            };
          };
        };
      };

      firewall = {
        enable = true;
        checkReversePath = "loose";
        allowedTCPPorts = [27036 27037 25565];
        allowedUDPPorts = [44857 27031 27036];
        allowPing = false;
      };
    };

    services.avahi = {
      enable = true;
      nssmdns4 = true;
      openFirewall = true;
    };
    environment.systemPackages = with pkgs; [
      protonvpn-gui
    ];
  };
}
