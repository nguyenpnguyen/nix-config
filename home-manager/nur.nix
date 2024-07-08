{pkgs, ...}: let
  nurpkgs = import (builtins.fetchTarball {
    url = "https://github.com/nix-community/NUR/archive/master.tar.gz";
    sha256 = "sha256:0yv7viid6x750l3384p77mk0carh53lqlpip6yaxambhqd2icrv3";
  }) {inherit pkgs;};
in {
  home.packages = with nurpkgs.repos; [
    LuisChDev.nordvpn
  ];
}
