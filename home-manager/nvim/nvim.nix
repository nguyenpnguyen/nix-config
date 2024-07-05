{pkgs, ...}: {
  home.packages = with pkgs; [
    neovide
  ];

  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    defaultEditor = true;

    plugins = with pkgs.vimPlugins; [
      # Telescope
      telescope-fzf-native-nvim
      telescope-ui-select-nvim
      telescope-nvim
      # Completion and snippets
      cmp_luasnip
      cmp-nvim-lsp
      luasnip
      friendly-snippets
      # UI
      neodev-nvim
      nvim-web-devicons
      fidget-nvim
      #Misc
      vim-nix
      vim-sleuth
      comment-nvim
      catppuccin-nvim
      todo-comments-nvim
      plenary-nvim
      popup-nvim
      nvim-autopairs
      mini-nvim
      nvim-cmp
      nvim-treesitter
      conform-nvim
      gitsigns-nvim
      which-key-nvim
      nvim-lspconfig
      oil-nvim
    ];

    extraLuaConfig = ''
      ${builtins.readFile ./options.lua}
      ${builtins.readFile ./plugins/misc.lua}
      ${builtins.readFile ./plugins/mini.lua}
      ${builtins.readFile ./plugins/cmp.lua}
      ${builtins.readFile ./plugins/telescope.lua}
      ${builtins.readFile ./plugins/treesitter.lua}
      ${builtins.readFile ./plugins/conform.lua}
      ${builtins.readFile ./plugins/gitsigns.lua}
      ${builtins.readFile ./plugins/which-key.lua}
      ${builtins.readFile ./plugins/lsp.lua}
      ${builtins.readFile ./plugins/oil.lua}
    '';

    extraPackages = with pkgs; [
      xclip
      wl-clipboard
      ripgrep
      fd
      lua52Packages.jsregexp
      # Nix
      nixd
      alejandra
      # Lua
      lua-language-server
      stylua
      # Python
      pyright
      black
      isort
      # Java
      google-java-format
      # Go
      gotools
      gopls
      golangci-lint
      golangci-lint-langserver
      # Web
      vscode-langservers-extracted
      typescript
      prettierd
      htmx-lsp
      rubyPackages.htmlbeautifier
      rustywind
      stylelint
      # Misc
      marksman
    ];
  };
}
