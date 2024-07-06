{
  description = "NixOS config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    catppuccin.url = "github:catppuccin/nix";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    nixpkgs,
    home-manager,
    catppuccin,
    ...
  } @ inputs: let
    system = "x86_64-linux";
    pkgs = import nixpkgs {
      inherit system;
      config = {
        allowUnfree = true;
        allowUnfreePredicated = _: true;
      };
    };
  in {
    nixosConfigurations = {
      thinkpad-nixos = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs system;};

        modules = [
          ./hosts/thinkpad-nixos
          catppuccin.nixosModules.catppuccin
          {
            environment.systemPackages = with pkgs; [
              vim
              wget
              curl
              freshfetch
            ];
          }
        ];
      };
    };
    homeConfigurations = {
      nguyen = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [
          ./home-manager/home.nix
          catppuccin.homeManagerModules.catppuccin
        ];
      };
    };
  };
}
