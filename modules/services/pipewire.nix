{
  flake.modules.nixos.services-pipewire = {pkgs, ...}: {
    services.pipewire = {
      enable = true;
      alsa = {
        enable = true;
        support32Bit = true;
      };
      pulse.enable = true;
      jack.enable = true;

      wireplumber.extraConfig."51-fifine-volume" = {
        "monitor.alsa.rules" = [
          {
            matches = [
              {
                "node.name" = "~alsa_output.*FIFINE.*";
              }
            ];
            actions = {
              update-props = {
                "api.alsa.ignore-dB" = true;
                "api.alsa.soft-mixer" = true;
              };
            };
          }
        ];
      };
    };

    systemd.services.mute-fifine-return = {
      description = "Mute the audio return from the Fifine AM8 microphone";
      after = ["sound.target"];
      wantedBy = ["multi-user.target"];
      serviceConfig = {
        Type = "oneshot";
        ExecStart = "-${pkgs.alsa-utils}/bin/amixer -D hw:Microphone set Mic playback 0% mute";
        RemainAfterExit = true;
      };
    };

    systemd.user.services.fix-fifine-volume = {
      description = "Force default audio volume to 100% after WirePlumber starts";
      after = ["wireplumber.service"];
      requires = ["wireplumber.service"];
      wantedBy = ["default.target"];
      serviceConfig = {
        Type = "oneshot";
        RemainAfterExit = true;
      };
      script = ''
        sleep 2
        ${pkgs.wireplumber}/bin/wpctl set-volume @DEFAULT_AUDIO_SINK@ 1.0
      '';
    };
  };
}
