{...}: {
  imports = [
    ./configuration.nix
    ./hardware-configuration.nix
    ./audio.nix

    # System packages
    ./keyd/keyd.nix
    ./wayland/wayland.nix
    ./greeter/greeter.nix
  ];
}
