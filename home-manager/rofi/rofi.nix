{ config, pkgs, ... }:

{
  home.packages = with pkgs; [ rofi-wayland ];
  xdg.configFile = {
    "rofi/config.rasi".source = ./config.rasi;
    "rofi/catppuccin-mocha.rasi".source = ./catppuccin-mocha.rasi;
  };
}
