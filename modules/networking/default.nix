{ config, pkgs, ... }:

{

  time.timeZone = "America/Bahia";

  networking = {
    nameservers = [ "185.228.168.168" "185.228.169.168" ];
    hostName = "rataria";
    networkmanager.enable = true;
    firewall = {
      enable = true;
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
      allowedTCPPorts = [ 443 80 ];
      allowedUDPPorts = [ 443 80 44857 ];
      allowPing = false;
>>>>>>> 0e212d2 (Add security modules)
=======
      allowedTCPPorts = [ 443 80 ];
      allowedUDPPorts = [ 443 80 44857 ];
      allowPing = false;
>>>>>>> 05c057b (A stable config)
=======
      allowedTCPPorts = [ 443 80 ];
      allowedUDPPorts = [ 443 80 44857 ];
      allowPing = false;
>>>>>>> master
    };
  };
}
