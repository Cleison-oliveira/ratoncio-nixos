{ ... }: {
  networking = {
    useDHCP = false;
    defaultGateway = "192.168.1.1";
    interfaces = {
      eno1 = {
        ipv4 = {
          addresses = [
            {
              address = "192.168.1.10";
              prefixLength = 24;
            }
          ];
        };
        ipv6 = {
          addresses = [
            {
              address = "fe80::206:c161:463a:4a63";
              prefixLength = 64;
            }
          ];
        };
      };
    };

    nameservers = [ "185.228.168.10" "185.228.169.11" ];

    networkmanager = {
      enable = true;
      dns = "none";
    };

    firewall = {
      enable = true;
      allowedTCPPorts = [ 443 80 ];
      allowedUDPPorts = [ 443 80 44857 ];
      allowPing = false;
    };
  };

  services = {
    avahi = {
      enable = true;
      nssmdns4 = true;
    };
  };
}
