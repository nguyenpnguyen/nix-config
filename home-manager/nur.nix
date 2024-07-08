{pkgs, ...}: let
  nurpkgs = import (builtins.fetchTarball "https://github.com/nix-community/NUR/archive/master.tar.gz") {inherit pkgs;};
in {
  home.packages = with nurpkgs.repos; [
    LuisChDev.nordvpn
  ];
}
