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
    tree
    wireshark
    fzf
    thunderbird
    teams-for-linux
    obsidian
    telegram-desktop
    protonvpn-cli_2
  ];

  i18n.inputMethod = {
    enabled = "fcitx5";
    fcitx5.addons = with pkgs; [
      fcitx5-unikey
    ];
  };
}
