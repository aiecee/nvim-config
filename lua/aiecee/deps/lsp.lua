return {
	{
		"folke/lazydev.nvim",
		ft = "lua", -- only load on lua files
		opts = {
			cmp = false,
		},
		config = true,
	},
	{ "williamboman/mason.nvim", opts = { ui = { border = "rounded" } }, config = true },
	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = { "neovim/nvim-lspconfig" },
		opts = require("aiecee.cfg.lsps"),
		config = function(_, servers)
			local mason_lspconfig = require("mason-lspconfig")
			local lsp_config = require("lspconfig")

			local capabilities = vim.lsp.protocol.make_client_capabilities()

			mason_lspconfig.setup({
				ensure_installed = vim.tbl_keys(servers),
			})

			mason_lspconfig.setup_handlers({
				function(server_name)
					local server_config = servers[server_name]
					if server_config == nil then
						return
					end

					lsp_config[server_name].setup({
						capabilities = capabilities,
						settings = server_config.settings,
						on_attach = server_config.on_attach,
					})
				end,
			})

			vim.lsp.handlers["textDocument/publishDiagnostics"] =
				vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
					update_in_insert = true,
				})

			vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
				border = "rounded",
			})
		end,
	},
	{
		"nvimdev/guard.nvim",
		dependencies = { "nvimdev/guard-collection", "aiecee/ace.nvim" },
		opts = {},
		config = function()
			local guard_tools = require("ace.mason-guard")
			guard_tools.setup({
				ensure_installed = { "prettier", "stylua", "selene", "codespell" },
			})

			local ft = require("guard.filetype")
			-- lua
			ft("lua"):fmt("lsp"):append("stylua"):lint("selene")
			-- node
			ft("typescript,javascript,typescriptreact,javascriptreact"):fmt("prettier")
			-- spelling
			ft("*"):lint("codespell")
			-- config files
			ft("yaml,json,toml"):fmt("prettier")

			require("guard").setup({
				fmt_on_save = true,
				lsp_as_default_formatter = true,
			})
		end,
	},
}
