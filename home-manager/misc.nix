{pkgs, ...}: {
  services = {
    swayosd.enable = true;
    network-manager-applet.enable = true;
  };

  home.packages = with pkgs; [
    bluetuith
    networkmanagerapplet
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

  i18n.inputMethod = {
    enabled = "fcitx5";
    fcitx5.addons = with pkgs; [
      fcitx5-unikey
    ];
  };
}
