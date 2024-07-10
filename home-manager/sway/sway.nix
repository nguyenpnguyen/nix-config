{...}: {
  wayland.windowManager.sway = {
    xwayland = true;
  };

  xdg.configFile = {
    "sway/config".source = ./config;
  };
}
