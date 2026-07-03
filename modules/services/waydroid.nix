{
  flake.modules.nixos.services-waydroid = {pkgs, ...}: let
    waydroid-setup = pkgs.writeShellScriptBin "waydroid-setup" ''
      nix \
        --extra-experimental-features "nix-command flakes" \
        run github:casualsnek/waydroid_script -- install gapps libhoudini
      doas systemctl restart waydroid-container
    '';

    waydroid-run = pkgs.writeShellScriptBin "waydroid-run" ''
      export WLR_RENDERER=vulkan
      export WLR_NO_HARDWARE_CURSORS=1
      exec waydroid show-full-ui
    '';
  in {
    virtualisation.waydroid = {
      enable = true;
      package = pkgs.waydroid-nftables;
    };

    environment.systemPackages = with pkgs; [
      wl-clipboard
      waydroid-setup
      waydroid-run
    ];
  };
}
