{ pkgs, inputs, ... }: {
  environment = {
    systemPackages = with pkgs; [
      wget
      curl
      tree
      busybox
      gcc
      gnumake
      fd
      appimage-run
      glib
      apparmor-utils
      inputs.noctalia.packages.${pkgs.stdenv.hostPlatform.system}.default
    ];
  };
}
