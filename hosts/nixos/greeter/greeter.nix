{pkgs, ...}: {
  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --cmd sway-run";
      };
    };
  };

  environment.systemPackages = let
    sway-run = pkgs.writeScriptBin "sway-run" ''
      #!/bin/sh

      # Session
      export XDG_SESSION_TYPE=wayland dbus-run-session
      export XDG_SESSION_DESKTOP=sway
      export XDG_CURRENT_DESKTOP=sway

      # Wayland stuff
      export MOZ_ENABLE_WAYLAND=1
      export QT_QPA_PLATFORM=wayland
      export SDL_VIDEODRIVER=wayland
      export _JAVA_AWT_WM_NONREPARENTING=1

      exec systemd-cat --identifier=sway sway "$@"
    '';
  in [sway-run];
}
