-- Load required dependencies
local conform = require("conform")

-- Setup conform.nvim
conform.setup({
	notify_on_error = true,
	formatters_by_ft = {
		c = { "clang-format" },
		cpp = { "clang-format" },
		lua = { "stylua" },
		python = { "isort", "black" },
		java = { "google-java-format" },
		javascript = { { "prettierd", "prettier" } },
		typescript = { { "prettierd", "prettier" } },
		jsx = { { "prettierd", "prettier" } },
		tsx = { { "prettierd", "prettier" } },
		go = { "gofmt", "goimports" },
		nix = { "alejandra" },
		html = { "htmlbeautifier", "rustywind" },
		css = { "stylelint" },
	},
	format_on_save = {
		timeout_ms = 500,
		lsp_format = "fallback",
	},
})

-- Define key mappings for autoformatting
local vim = vim
vim.api.nvim_set_keymap(
	"n",
	"<leader>f",
	'<cmd>lua require("conform").format { async = true, lsp_fallback = true }<CR>',
	{ noremap = true, silent = true }
)
