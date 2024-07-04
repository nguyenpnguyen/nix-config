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
		javascript = { "prettierd", "prettier" },
		typescript = { "prettierd", "prettier" },
		go = { "gofumpt", "goimports" },
	},
	format_on_save = function(bufnr)
		-- Disable "format_on_save lsp_fallback" for languages that don't
		-- have a well standardized coding style. You can add additional
		-- languages here or re-enable it for the disabled ones.
		local disable_filetypes = { c = true, cpp = true }
		return {
			timeout_ms = 500,
			lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype],
		}
	end,
})

-- Define key mappings for autoformatting
local vim = vim
vim.api.nvim_set_keymap(
	"n",
	"<leader>f",
	'<cmd>lua require("conform").format { async = true, lsp_fallback = true }<CR>',
	{ noremap = true, silent = true }
)
