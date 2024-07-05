{
  config,
  pkgs,
  ...
}: {
  home = {
    packages = with pkgs; [
      jetbrains.idea-community
      jetbrains.idea-ultimate
      vscode
      zed-editor
      # C
      gcc
      libgcc
      cmake
      llvmPackages_18.clang-tools
      llvm
      # Lua
      lua
      # Go
      go
      # Rust
      rustup
      # JS
      nodejs
      pnpm
      bun
      # Java
      jdk
      jdt-language-server
      # Python
      (python3.withPackages (subpkgs:
        with subpkgs; [
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
    "Code" = {
      source = ./vscode;
      recursive = true;
    };
  };
}
