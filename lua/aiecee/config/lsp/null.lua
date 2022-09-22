local lsp_config = require("lspconfig")
local null_ls = require("null-ls")
local builtins = null_ls.builtins

local M = {}

function M.setup()
	local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
	null_ls.setup({
		sources = {
			-- Prettier
			builtins.formatting.prettier_d_slim,
			-- Stylua
			builtins.formatting.stylua,
			-- eslint_d
			builtins.code_actions.eslint_d,
			builtins.diagnostics.eslint_d,
			builtins.formatting.eslint_d,
		},
		on_attach = function(client, bufnr)
			if client.supports_method("textDocument/formatting") then
				vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
				vim.api.nvim_create_autocmd("BufWritePre", {
					group = augroup,
					buffer = bufnr,
					callback = function()
						vim.lsp.buf.formatting_seq_sync(nil, 5000, { "null-ls" })
					end,
				})
			end
		end,
		root_dir = lsp_config.util.root_pattern("package.json", ".null-ls-root", "Makefile", ".git"),
	})
end

return M
