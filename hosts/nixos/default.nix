{...}: {
  imports = [
    ./configuration.nix
    ./hardware-configuration.nix
    ./audio.nix

    # System packages
    ./keyd/keyd.nix
    ./sway/sway.nix
    ./greeter/greeter.nix
  ];
}
