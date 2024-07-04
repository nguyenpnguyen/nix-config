{ config, pkgs, ... }:

{
  programs.waybar.enable = true;

  xdg.configFile = {
    "waybar/config.jsonc".source = ./config.jsonc;
    "waybar/style.css".source = ./style.css;
  };

  home = {
    packages = with pkgs; [ waybar python311Packages.pycairo ];
    file = {
      "bin/mediaplayer.py".source = ./scripts/mediaplayer.py;
      "bin/sunONOFF.sh".source = ./scripts/sunONOFF.sh;
    };
  };
}
