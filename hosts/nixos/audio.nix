{
  config,
  pkgs,
  ...
}: {
  hardware = {
    pulseaudio = {
      enable = false;
      extraModules = [pkgs.pulseaudio-modules-bt];
    };
    bluetooth = {enable = true;};
  };

  # Enable sound
  sound = {
    enable = false;
    mediaKeys.enable = true;
  };

  # Enable audio through pipewire
  services = {
    pipewire = {
      enable = true;
      alsa = {
        enable = true;
        support32Bit = true;
      };
      pulse.enable = true;
      wireplumber.enable = true;
      extraConfig = {
        pipewire-pulse = {
          "pulse.cmd" = [
            {
              "cmd" = "load-module";
              "args" = "module-switch-on-connect";
            }
          ];
        };
      };
    };
  };

  environment = {
    systemPackages = with pkgs; [bluez bluez-tools blueman pulseaudio playerctl];
  };
}
