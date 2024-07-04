-- Load required dependencies
local treesitter = require('nvim-treesitter')

-- Setup nvim-treesitter
treesitter.setup {
  ensure_installed = { 'bash', 'c', 'diff', 'html', 'lua', 'luadoc', 'markdown', 'vim', 'vimdoc', 'javascript', 'typescript' },
  auto_install = true,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = { 'ruby' },
  },
  indent = {
    enable = true,
    disable = { 'ruby' },
  },
}

-- Prefer git instead of curl for installation in some environments
require('nvim-treesitter.install').prefer_git = true
