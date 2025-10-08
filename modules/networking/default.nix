{ config, pkgs, ... }:

{

  time.timeZone = "America/Bahia";

  networking = {
    nameservers = [ "185.228.168.168" "185.228.169.168" ];
    networkmanager.enable = true;
    firewall = {
      enable = true;
      allowedTCPPorts = [ 443 80 ];
      allowedUDPPorts = [ 443 80 44857 ];
      allowPing = false;
    };
  };
}
