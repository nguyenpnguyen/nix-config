{...}: {
  imports = [
    ./sh.nix
    ./git.nix
    ./nvim/nvim.nix
    ./waybar/waybar.nix
    ./wezterm/wezterm.nix
    # ./foot/foot.nix
    ./tmux/tmux.nix
    # ./dunst/dunst.nix
    ./swaync/swaync.nix
    ./swaylock/swaylock.nix
    ./rofi/rofi.nix
    ./dev/dev.nix
    ./desktop/desktop.nix
    ./lf/lf.nix
    ./theme.nix
    ./misc.nix
    ./btop/btop.nix
    ./wallpapers/wallpapers.nix
  ];
  home = {
    username = "nguyen";
    homeDirectory = "/home/nguyen";

    stateVersion = "24.05";
  };

  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      "text/plain" = ["neovide.desktop"];
      "text/x-asm" = ["neovide.desktop"];
      "application/pdf" = ["org.pwmt.zathura-pdf-mupdf.desktop"];
      "image/gif" = ["imv-dir.desktop"];
      "image/jpeg" = ["imv-dir.desktop"];
      "image/png" = ["imv-dir.desktop"];
      "video/*" = ["vlc.desktop"];
      "text/html" = "floorp.desktop";
      "x-scheme-handler/http" = "floorp.desktop";
      "x-scheme-handler/https" = "floorp.desktop";
      "x-scheme-handler/about" = "floorp.desktop";
      "x-scheme-handler/unknown" = "floorp.desktop";
      "text/calendar" = "thunderbird.desktop";
      "text/vcalendar" = "thunderbird.desktop";
    };
  };

  # Programs
  programs = {
    home-manager.enable = true;
  };

  fonts.fontconfig.enable = true;

  systemd.user.targets.tray = {
    Unit = {
      Description = "Home Manager System Tray";
      Requires = ["graphical-session-pre.target"];
    };
  };
}
