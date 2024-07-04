{ config, pkgs, lib, ... }:

{
  environment = {
    systemPackages = with pkgs; [
      xdg-desktop-portal
      xdg-desktop-portal-wlr
      xdg-desktop-portal-gtk
      xdg-utils
      libnotify
      glib

      fontconfig
      kanshi

      swaylock
      swayidle
      sway-audio-idle-inhibit
      swaybg
      swayosd

      wl-clipboard
      cliphist
      wlsunset

      grim
      slurp
      sway-contrib.grimshot
      pavucontrol

      xfce.thunar
      xfce.thunar-volman
      xfce.thunar-dropbox-plugin
      xfce.thunar-archive-plugin
      xfce.thunar-media-tags-plugin
    ];
    etc = {
      "sway/config".source = lib.mkForce ./config;
    };
  };

  services = {
    dbus.enable = true;
  };

  xdg.portal = {
    enable = true;
    wlr.enable = true;
    extraPortals = lib.mkForce [ pkgs.xdg-desktop-portal-gtk ];
  };

  programs ={
    sway = {
      enable = true;
      wrapperFeatures.gtk = true;
    };
    light.enable = true;
  };

  systemd.user.services.kanshi = {
    description = "kanshi daemon";
    serviceConfig = {
      Type = "simple";
      ExecStart = ''${pkgs.kanshi}/bin/kanshi -c kanshi_config_file'';
    };
  };

  catppuccin = {
    enable = true;
    flavor = "macchiato";
    accent = "flamingo";
  };
}
