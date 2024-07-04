{ config, pkgs, ... }:

{
  home.packages = with pkgs; [ neovide ];

  programs.neovim =
  let
    toLua = str: "lua << EOF\n${str}\nEOF\n";
    toLuaFile = file: "lua << EOF\n${builtins.readFile file}\nEOF\n";
  in {
    enable = true;
    viAlias = true;
    vimAlias = true;
    defaultEditor = true;

    plugins = with pkgs.vimPlugins; [
      telescope-fzf-native-nvim
      telescope-ui-select-nvim

      cmp_luasnip
      cmp-nvim-lsp
      luasnip
      friendly-snippets

      neodev-nvim
      nvim-web-devicons
      fidget-nvim

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
      telescope-nvim
      nvim-treesitter
      conform-nvim
      gitsigns-nvim
      which-key-nvim
      nvim-lspconfig
      oil-nvim

      vim-clang-format
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

      luajitPackages.lua-lsp
      lua-language-server
      stylua

      pyright
      black
      isort

      gofumpt
      gotools
      gopls

      ccls

      typescript
      prettierd
    ];
  };
}
