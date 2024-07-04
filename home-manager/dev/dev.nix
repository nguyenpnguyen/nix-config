{ config, pkgs, ... }:

{
  home = {
    packages = with pkgs; [
      jetbrains.idea-community
      jetbrains.idea-ultimate
      vscodium
      zed-editor

      gcc
      libgcc
      cmake
      llvmPackages_18.clang-tools
      llvm
      lua
      go
      rustup
      nodejs
      pnpm
      bun
      jdk
      (python3.withPackages (subpkgs: with subpkgs; [
        pip
        pygobject3
      ]))

      gobject-introspection
    ];
    sessionVariables = {
      EDITOR = "nvim";
    };
    file = {
      ".ideavimrc".source = ./ideavimrc;
    };
  };
  xdg.configFile = {
    "VSCodium" = {
      source = ./vscodiumconf;
      recursive = true;
    };
  };
}
