{ config, pkgs, lib, ... }:

{
  programs.waybar.enable = true;

  xdg.configFile = {
    "waybar/config.jsonc".source = ./config.jsonc;
    "waybar/style.css".source = lib.mkForce ./style.css;
  };

  home.file = {
    "bin/mediaplayer.py".source = ./scripts/mediaplayer.py;
    "bin/sunONOFF.sh".source = ./scripts/sunONOFF.sh;
  };
}
