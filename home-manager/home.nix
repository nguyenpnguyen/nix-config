{ config, pkgs, ... }:

{
  imports = [
    ./sh.nix
    ./git.nix
    ./nvim/nvim.nix
    ./waybar/waybar.nix
    ./wezterm/wezterm.nix
    ./foot/foot.nix
    ./tmux/tmux.nix
    ./dunst/dunst.nix
    ./swaylock/swaylock.nix
    ./rofi/rofi.nix
    ./dev/dev.nix
    ./misc.nix
  ];
  home = {
    username = "nguyen";
    homeDirectory = "/home/nguyen";

    stateVersion = "24.05";

    packages = with pkgs; [
      zathura
      imv
      vlc
      spotify
      spotify-tray
      nerdfonts

      brave
      btop
      tree
      wireshark
      fzf
    ];
  };
  

  xdg.mimeApps.defaultApplications = {
    "text/plain" = [ "neovide.desktop" ];
    "application/pdf" = [ "zathura.desktop" ];
    "image/*" = [ "imv.desktop" ];
    "video/*" = [ "vlc.desktop" ];
  };

  # Programs
  programs = {
    home-manager.enable = true;
  };

  fonts.fontconfig.enable = true;
  systemd.user.targets.tray = {
      Unit = {
          Description = "Home Manager System Tray";
          Requires = [ "graphical-session-pre.target" ];
      };
  };
}
