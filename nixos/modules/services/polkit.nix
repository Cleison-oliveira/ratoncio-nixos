{ pkgs, ... }:
{
  services.gnome.gnome-keyring.enable = true;
  security.pam.services.login.enableGnomeKeyring = true;
  environment.systemPackages = [
    pkgs.pantheon.pantheon-agent-polkit
  ];
}
