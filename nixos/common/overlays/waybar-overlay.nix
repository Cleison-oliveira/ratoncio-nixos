self: super: {
  waybar = super.waybar.overrideAttrs (oldAttrs: {
    patches = oldAttrs.patches or [ ] ++ [
      ./patches/waybar_workspaces.patch
    ];
  });
}
