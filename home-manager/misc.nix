{pkgs, ...}: {
  services = {
    swayosd.enable = true;
  };

  home.packages = with pkgs; [
    bluetuith
    gtk3
    libreoffice-fresh
    floorp
    brave
    zathura
    imv
    vlc
    spotify
    spotify-tray
    nerdfonts
    btop
    tree
    wireshark
    fzf
  ];

  programs = {
    lf.enable = true;
  };

  i18n.inputMethod = {
    enabled = "fcitx5";
    fcitx5.addons = with pkgs; [
      fcitx5-unikey
    ];
  };
}
