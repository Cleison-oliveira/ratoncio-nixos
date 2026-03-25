{
  flake.modules.nixos.services-pipewire = {pkgs, ...}: {
    services.pipewire = {
      enable = true;
      alsa = {
        enable = true;
        support32Bit = true;
      };
      pulse.enable = true;
    };

    systemd.services.mute-fifine-return = {
      description = "Mute the audio return from the Fifine AM8 microphone";
      after = ["sound.target"];
      wantedBy = ["multi-user.target"];
      serviceConfig = {
        Type = "oneshot";
        ExecStart = "${pkgs.alsa-utils}/bin/amixer -D hw:Microphone set Mic playback 0% mute";
        RemainAfterExit = true;
      };
    };
  };
}
