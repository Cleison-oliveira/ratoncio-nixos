{ pkgs, ... }: with pkgs; {

  security = {
    doas = {
      extraRules = [{
        users = [ "steam" ];
        keepEnv = true;
        persist = true;
      }];
    };
  };

  users = {
    users = {
      steam = {
        isNormalUser = true;
        shell = fish;
        description = "steam user";
        extraGroups = [
          "networkmanager"
          "wheel"
          "allowusers"
          "gamemode"
          "input"
          "audio"
          "render"
          "video"
          "shareddata"
        ];
        hashedPassword = "$6$dt44z3QLC3K/FN3E$fDcoLNUmuqjFNxZIjq37NcuWt7Qfn06wJua.5lLlJNOxZrzLJwP3wbxlbm5Hpz9MZoMV3KCfWvGENAxdnNCV//";
      };
    };
  };
}
