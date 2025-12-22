{ pkgs, ... }: with pkgs; {

  security = {
    doas = {
      extraRules = [{
        users = [ "ratoncio" ];
        keepEnv = true;
        persist = true;
      }];
    };
  };

  hardware.i2c.enable = true;

  users = {
    users = {
      ratoncio = {
        isNormalUser = true;
        shell = fish;
        description = "ratoncio";
        extraGroups = [
          "networkmanager"
          "wheel"
          "allowusers"
          "libvirtd"
          "docker"
          "kvm"
          "input"
          "audio"
          "render"
          "video"
          "scanner"
          "lp"
          "i2c"
          "shareddata"
        ];
        hashedPassword = "$6$4jahjQj8GmEKllbZ$qDP2NqWQ3R4XzU8C66S8dWp1hGFW4QdSL1biKndyp.O31yvhvZWJbKYGEUwVfOa6UWYgWsjDPItsQNhbeTK3N1";
      };
    };
  };
}
