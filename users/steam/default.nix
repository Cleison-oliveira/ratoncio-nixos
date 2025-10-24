{ config, pkgs, unstable, ... }: {
  security.doas.extraRules = [{
    users = [ "steam" ];
    keepEnv = true;
    persist = true;
  }];

  users.users.steam = {
    isNormalUser = true;
    shell = pkgs.fish;
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
    ];

    packages = (with pkgs; [
      discord
      chromium
      kdePackages.kdenlive
      mangohud
      lutris
      heroic
      rpcs3
      pcsx2
      dolphin-emu
      protonup-qt
      steam-run
      mangojuice
      vulkan-tools
      umu-launcher
    ]) ++ (with unstable; [
      lsfg-vk-ui
      lsfg-vk
    ]);

    hashedPassword = "$6$dt44z3QLC3K/FN3E$fDcoLNUmuqjFNxZIjq37NcuWt7Qfn06wJua.5lLlJNOxZrzLJwP3wbxlbm5Hpz9MZoMV3KCfWvGENAxdnNCV//";
  };
}
