{ pkgs, ... }: with pkgs; {
  home = {
    packages = [
      discord
      telegram-desktop
      chromium
    ];
  };
}
