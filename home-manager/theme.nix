{ config, pkgs, ... }:

{
  catppuccin = {
    enable = true;
    flavor = "macchiato";
    accent = "flamingo";
    pointerCursor = {
      enable = true;
      flavor = "mocha";
      accent = "mauve";
    };
  };

 gtk = {
    enable = true;
    font.name = "DejaVuSansM Nerd Font Regular 11";

    theme = {
        name = "Catppuccin-Macchiato-Standard-Flamingo-Dark";
        package = pkgs.catppuccin-gtk;
      };

    iconTheme = {
        name = "cat-macchiato-blue";
        package = pkgs.catppuccin-papirus-folders;
    };

    cursorTheme = {
        name = "mochaMauve";
        size = 24;
        package = pkgs.catppuccin-cursors;
    };

    gtk3.extraConfig = {
      Settings = ''
        gtk-application-prefer-dark-theme=1
      '';
    };

    gtk4.extraConfig = {
      Settings = ''
        gtk-application-prefer-dark-theme=1
      '';
    };
  };
}
