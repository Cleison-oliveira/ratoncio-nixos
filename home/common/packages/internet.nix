{ pkgs, ... }: with pkgs; {
  home = {
    packages = [
      discord
      chromium
      telegram-desktop
    ];
  };
}
