{ config, pkgs, user, ... }:

{
  imports = [
    ./configuration.nix
    ./hardware-configuration.nix
    ./audio.nix
  ];
}
