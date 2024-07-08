{pkgs, ...}: {
  home = {
    packages = with pkgs; [
      pistol
      kitty
      ffmpegthumbnailer
      file
    ];
    file = {
      "bin/vidthumb" = {
        source = ./vidthumb;
        executable = true;
      };
    };
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
    "lf/lfcd.sh" = {
      source = ./lfcd.sh;
      executable = true;
    };
  };

  programs = {
    lf = {
      enable = true;
      settings = {
        cleaner = "~/.config/lf/lf-kitty-clean";
        previewer = "~/.config/lf/lf-kitty-preview";
      };
      keybindings = {
        D = "trash";
        U = "!du -sh";
        gg = null;
        gh = "cd ~";
        i = "$less $f";
      };
    };
  };
}
