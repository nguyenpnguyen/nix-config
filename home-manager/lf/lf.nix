{pkgs, ...}: {
  home = {
    packages = with pkgs; [
      pistol
      kitty
      ffmpegthumbnailer
    ];
    file = {
      "bin/vidthumb" = {
        source = ./vidthumb;
        executable = true;
      };
    };
  };

  programs = {
    lf = {
      enable = true;
      previewer.source = "~/.config/lf/lf-kitty-preview";
      settings.cleaner = "~/.config/lf/lf-kitty-clean";
    };

    xdg.configFile = {
      "lf/lf-kitty-preview" = {
        source = ./lf-kitty-preview;
        executable = true;
      };
      "lf/lf-kitty-clean" = {
        source = ./lf-kitty-clean;
        executable = true;
      };
    };
  };
}
