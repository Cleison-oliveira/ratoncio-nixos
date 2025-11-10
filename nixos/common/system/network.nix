{ ... }: {
  networking = {
    nameservers = [ "1.0.0.3" "1.1.1.3" ];
    networkmanager = {
      enable = true;
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
