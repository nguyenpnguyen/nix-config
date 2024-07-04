{ config, pkgs, ... }:

{
  programs = {
    git = {
      enable = true;
      userName = "Nguyen Phuc Nguyen";
      userEmail = "nguyen.pn@proton.me";
      ignores = [ "node_modules" "*.env" ];
      extraConfig = {
        user = { username = "nguyenpnguyen"; };
        core = { editor = "nvim"; };
        init = { defaultBranch = "main"; };
      };
    };
  };
}
