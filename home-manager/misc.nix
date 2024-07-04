{ config, pkgs, ... }:

{
  services = {
    swayosd.enable = true;
  };

  home.packages = with pkgs; [
    bluetuith
    gtk3
  ];

  programs = {
    lf.enable = true;
  };

  i18n.inputMethod = {
    enabled = "fcitx5";
    fcitx5.addons = with pkgs; [
        fcitx5-unikey
    ];
  };
}
