local lsp_config = require("lspconfig")
local mason_null_ls = require("mason-null-ls")
local null_ls = require("null-ls")
local builtins = null_ls.builtins

local M = {}

function M.setup()
	mason_null_ls.setup({
		ensure_installed = { "eslint_d", "prettierd", "stylua" },
		automatic_installation = false,
		automatic_setup = true,
	})

	local augroup = vim.api.nvim_create_augroup("lsp_formatting", {})
	null_ls.setup({
		sources = {
			builtins.formatting.prettierd,
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
						vim.lsp.buf.format({
							formatting_options = nil,
							timeout_ms = 5000,
							filter = function(cli)
								return cli.name == "null-ls"
							end,
						})
					end,
				})
			end
		end,
		root_dir = lsp_config.util.root_pattern(
			"package.json",
			".null-ls-root",
			"Makefile",
			".git",
			"settings.gradle",
			".gradle"
		),
	})
end

return M
