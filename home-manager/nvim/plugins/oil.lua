-- Load required dependencies
local oil = require("oil")

-- Setup oil.nvim
oil.setup({
	view_options = {
		show_hidden = true,
	},
})

vim.api.nvim_set_keymap("n", "<leader>e", ":Oil<CR>", { noremap = true, silent = true })
