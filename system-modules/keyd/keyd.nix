{ config, pkgs, ... }:

let
  keydDefaultConfig = builtins.readFile ./default.conf;
  keydThinkpadConfig = builtins.readFile ./thinkpad.conf;
in {
  environment = {
    etc = {
      "keyd/default.conf".text = keydDefaultConfig;
      "keyd/thinkpad.conf".text = keydThinkpadConfig;
    };
    systemPackages = with pkgs; [ keyd ];
  };

  services.keyd.enable = true;
}
