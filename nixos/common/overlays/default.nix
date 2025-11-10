{ ... }: {
  nixpkgs = {
    overlays = [
      (import ./keet-overlay.nix)
      (import ./waybar-overlay.nix)
    ];
  };
}
