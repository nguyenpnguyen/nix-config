{ config, pkgs, ... }:

{
  services = {
    swayosd.enable = true;
  };
  home.packages = with pkgs; [
    bluetuith
  ];
  i18n.inputMethod = {
    enabled = "fcitx5";
    fcitx5.addons = with pkgs; [
        fcitx5-unikey
    ];
  };
}
