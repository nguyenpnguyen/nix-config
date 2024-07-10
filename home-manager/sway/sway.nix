{pkgs, ...}: {
  home.packages = with pkgs; [
    light
  ];
  wayland.windowManager.sway = {
    enable = true;
    xwayland = true;
    extraConfig = ''
      ${builtins.readFile ./config}
    '';
    checkConfig = true;
    wrapperFeatures.gtk = true;
  };
}
