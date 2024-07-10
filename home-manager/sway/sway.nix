{pkgs, ...}: {
  home.packages = with pkgs; [
    light
  ];

  wayland.windowManager.sway = {
    xwayland = true;
    wrapperFeatures.gtk = true;
  };

  xdg.configFile = {
    "sway/config".source = ./config;
  };
}
