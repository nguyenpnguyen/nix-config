{pkgs, ...}: {
  home.packages = with pkgs; [
    kanshi
    swaylock
    swayidle
    swaybg
    swayosd
    wl-clipboard
    cliphist
    wlsunset
    grim
    slurp
    sway-contrib.grimshot
    pavucontrol
  ];
  services = {
    kanshi.enable = true;
    wlsunset = {
      enable = true;
      sunset = "21:00";
      sunrise = "06:00";
      temperature.night = 4200;
    };
  };
}
