{ ... }:
{
  networking = {
    networkmanager = {
      enable = true;
      dns = "none";
    };

    defaultGateway = "192.168.1.1";
    nameservers = [
      "1.1.1.1"
      "8.8.8.8"
    ];

    interfaces.eno1 = {
      useDHCP = false;
      ipv4.addresses = [
        {
          address = "192.168.1.10";
          prefixLength = 24;
        }
      ];
    };

    firewall = {
      enable = true;
      allowedTCPPorts = [ 27036 27037 25565 ];
      allowedUDPPorts = [ 44857 27031 27036 ];
      allowPing = false;
    };
  };

  services.avahi = {
    enable = true;
    nssmdns4 = true;
    openFirewall = true;
  };
}
