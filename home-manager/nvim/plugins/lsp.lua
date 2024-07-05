-- Load required dependencies
local lspconfig = require("lspconfig")

-- Enable snippets
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

-- Setup LSP servers
local servers = {
	-- Nix
	nixd = {},
	-- C and C++
	clangd = {},
	-- Go
	gopls = {},
	golangci_lint_ls = {},
	-- Java
	jdtls = {},
	-- Python
	pyright = {},
	-- Lua
	lua_ls = {
		settings = {
			Lua = {
				completion = {
					callSnippet = "Replace",
				},
				diagnostics = { disable = { "missing-fields" } }, -- Disable noisy missing-fields diagnostic
			},
		},
	},
	-- Web
	tsserver = {},
	eslint = {
		on_attach = function(client, bufnr)
			vim.api.nvim_create_autocmd("BufWritePre", {
				buffer = bufnr,
				command = "EslintFixAll",
			})
		end,
	},
	cssls = { capabilities = capabilities },
	html = { capabilities = capabilities },
	htmx = {},
	-- Misc
	marksman = {},
}

-- Setup LSP configurations using lspconfig
for server_name, server_config in pairs(servers) do
	lspconfig[server_name].setup(server_config)
end

-- Setup LSP related mappings using Telescope
vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("kickstart-lsp-attach", { clear = true }),
	callback = function(event)
		-- Require the built-in module from Telescope within the callback
		local builtin = require("telescope.builtin")

		local map = function(keys, func, desc)
			vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
		end

		-- Example mappings using Telescope for LSP actions
		map("gd", builtin.lsp_definitions, "[G]oto [D]efinition")
		map("gr", builtin.lsp_references, "[G]oto [R]eferences")
		map("gI", builtin.lsp_implementations, "[G]oto [I]mplementation")
		map("<leader>D", builtin.lsp_type_definitions, "Type [D]efinition")
		map("<leader>ds", builtin.lsp_document_symbols, "[D]ocument [S]ymbols")
		map("<leader>ws", builtin.lsp_dynamic_workspace_symbols, "[W]orkspace [S]ymbols")
		map("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
		map("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")
		map("K", vim.lsp.buf.hover, "Hover Documentation")
		map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
		map("<leader>th", function()
			vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
		end, "[T]oggle Inlay [H]ints")
	end,
})
