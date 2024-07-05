{...}: {
  imports = [
    ./configuration.nix
    ./hardware-configuration.nix
    ./audio.nix

    # System packages
    ../../system-modules/keyd/keyd.nix
    ../../system-modules/sway/sway.nix
    ../../system-modules/sddm/sddm.nix
  ];
}
