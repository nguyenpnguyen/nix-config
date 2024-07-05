-- Colorscheme
vim.cmd("colorscheme catppuccin-macchiato")

-- Comment
require("Comment").setup()

-- Highlight TODOs
require("todo-comments").setup({
	signs = false,
})

-- Autopairs
require("nvim-autopairs").setup({})
