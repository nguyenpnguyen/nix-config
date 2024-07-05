-- Load required dependencies
local whichkey = require("which-key")

-- Setup which-key.nvim
whichkey.setup({})

-- Document existing key chains
whichkey.register({
	["<leader>c"] = { name = "[C]ode", _ = "which_key_ignore" },
	["<leader>d"] = { name = "[D]ocument", _ = "which_key_ignore" },
	["<leader>r"] = { name = "[R]ename", _ = "which_key_ignore" },
	["<leader>s"] = { name = "[S]earch", _ = "which_key_ignore" },
	["<leader>w"] = { name = "[W]orkspace", _ = "which_key_ignore" },
	["<leader>t"] = { name = "[T]oggle", _ = "which_key_ignore" },
	["<leader>h"] = { name = "Git [H]unk", _ = "which_key_ignore" },
})

-- Visual mode key registration
whichkey.register({
	["<leader>h"] = { "Git [H]unk" },
}, { mode = "v" })
