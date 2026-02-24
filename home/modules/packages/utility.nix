{ pkgs, ... }:
{
  home.packages = with pkgs; [
    wget
    curl
    fd
    jq
    usbutils
    hplip
    vulkan-tools
    onlyoffice-desktopeditors
    keepassxc
    wasabiwallet
  ];
}
