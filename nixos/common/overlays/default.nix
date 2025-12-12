{ ... }: {
  nixpkgs = {
    overlays = [
      (import ./keet-overlay.nix)
    ];
  };
}
