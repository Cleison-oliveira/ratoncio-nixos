{ config, lib, pkgs, ... }:

{
  programs.gamemode = {
    enable = true;
    settings = {
      general = {
        inhibit_screensaver = 0;
      };
    };
  };

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
  };

  programs.steam.package = pkgs.steam.override {
    extraPkgs = pkgs': with pkgs'; [
      xorg.libXcursor
      xorg.libXi
      xorg.libXinerama
      xorg.libXScrnSaver
      libpng
      libpulseaudio
      libvorbis
      stdenv.cc.cc.lib # Provides libstdc++.so.6
      libkrb5
      keyutils
      gamescope
    ];
  };
}
