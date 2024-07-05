{ inputs, config, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ./audio.nix

      # System packages
      ../../system-modules/keyd/keyd.nix
      ../../system-modules/sway/sway.nix
      ../../system-modules/sddm/sddm.nix
    ];

  # Bootloader.
  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
  };

  # Enable networking
  networking = {
    hostName = "nixos"; # Define your hostname.
    networkmanager.enable = true;
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  };

  # Services
  services = {
    xserver = {
      enable = true;
      xkb = {
	layout = "us";
	variant = "";
      };
    };
    gnome.gnome-keyring.enable = true;
    printing.enable = true;
    libinput.enable = true;
    openssh.enable = true;
  };
  
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  security = {
    polkit.enable = true;
    pam = {
      services.swaylock = {};
      loginLimits = [
	{ domain = "@users"; item = "rtprio"; type = "-"; value = 1; }
      ];
    };
    rtkit.enable = true;
  };

  # Set your time zone.
  time.timeZone = "Asia/Ho_Chi_Minh";

  # Select internationalisation  properties.
  i18n = {
    defaultLocale = "en_US.UTF-8";
    extraLocaleSettings = {
      LC_ADDRESS = "vi_VN";
      LC_IDENTIFICATION = "vi_VN";
      LC_MEASUREMENT = "vi_VN";
      LC_MONETARY = "vi_VN";
      LC_NAME = "vi_VN";
      LC_NUMERIC = "vi_VN";
      LC_PAPER = "vi_VN";
      LC_TELEPHONE = "vi_VN";
      LC_TIME = "en_CA.UTF-8";
    };
  };

  programs = {
    zsh.enable = true;
    firefox.enable = true;
    mtr.enable = true;
    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };
  };

  users.users.nguyen = {
    isNormalUser = true;
    extraGroups = [ "networkmanager" "wheel" "keyd" "video" ];
    shell = pkgs.zsh;
  };

  fonts.fontconfig.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Perform garbage collection weekly to maintain low disk usage
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 1w";
  };

  # Optimize storage
  # You can also manually optimize the store via:
  #    nix-store --optimise
  # Refer to the following link for more details:
  # https://nixos.org/manual/nix/stable/command-ref/conf-file.html#conf-auto-optimise-store
  nix.settings.auto-optimise-store = true;

  system.stateVersion = "24.05";
}
