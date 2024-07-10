{
  pkgs,
  lib,
  ...
}: {
  environment = {
    systemPackages = with pkgs; [
      xdg-desktop-portal
      xdg-desktop-portal-wlr
      xdg-desktop-portal-gtk
      xdg-utils
      libnotify
      glib
    ];
  };

  services = {
    dbus.enable = true;
  };

  xdg.portal = {
    enable = true;
    wlr.enable = true;
    extraPortals = lib.mkForce [pkgs.xdg-desktop-portal-gtk];
    config.common.default = "*";
  };

  catppuccin = {
    enable = true;
    flavor = "macchiato";
    accent = "flamingo";
  };
}
