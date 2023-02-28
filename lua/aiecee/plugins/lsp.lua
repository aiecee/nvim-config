return {
	{ "williamboman/mason.nvim", opts = { border = "rounded" }, config = true },
	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = { "neovim/nvim-lspconfig", "hrsh7th/cmp-nvim-lsp", "simrat39/rust-tools.nvim" },
		opts = function()
			local cssls = require("aiecee.config.lsp.cssls")
			local gopls = require("aiecee.config.lsp.gopls")
			local html = require("aiecee.config.lsp.html")
			local jsonls = require("aiecee.config.lsp.jsonls")
			local pylsp = require("aiecee.config.lsp.pylsp")
			local rust_analyzer = require("aiecee.config.lsp.rust-analyzer")
			local lua_ls = require("aiecee.config.lsp.lua-ls")
			local tailwindcss = require("aiecee.config.lsp.tailwindcss")
			-- local theme_check = require("aiecee.config.lsp.theme-check")
			local tsserver = require("aiecee.config.lsp.tsserver")

			local function add_server(table, server)
				table[server.mason_name] = {
					name = server.name,
					settings = server.settings,
					on_attach = server.on_attach,
				}
			end

			local servers = {}
			add_server(servers, cssls)
			add_server(servers, gopls)
			add_server(servers, html)
			add_server(servers, jsonls)
			add_server(servers, pylsp)
			add_server(servers, rust_analyzer)
			add_server(servers, lua_ls)
			add_server(servers, tailwindcss)
			-- add_server(servers, theme_check)
			add_server(servers, tsserver)
			return servers
		end,
		config = function(_, servers)
			local mason_lspconfig = require("mason-lspconfig")
			local lsp_config = require("lspconfig")
			local cmp_lsp = require("cmp_nvim_lsp")

			local capabilities = vim.lsp.protocol.make_client_capabilities()
			capabilities = cmp_lsp.default_capabilities(capabilities)

			mason_lspconfig.setup({
				ensure_installed = vim.tbl_keys(servers),
			})

			mason_lspconfig.setup_handlers({
				function(server_name)
					local server_config = servers[server_name]
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
		"jose-elias-alvarez/null-ls.nvim",
		opts = function()
			local builtins = require("null-ls").builtins
			local augroup = vim.api.nvim_create_augroup("lsp_formatting", {})
			return {
				sources = {
					-- prettierd
					builtins.formatting.prettierd,
					-- Stylua
					builtins.formatting.stylua,
					-- eslint_d
					builtins.code_actions.eslint_d,
					builtins.diagnostics.eslint_d,
					builtins.formatting.eslint_d,
					-- black
					builtins.formatting.black,
					-- pylint
					builtins.diagnostics.pylint,
					-- rustfmt
					builtins.formatting.rustfmt,
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
			}
		end,
		config = true,
	},
	{
		"jayp0521/mason-null-ls.nvim",
		opts = {
			ensure_installed = { "eslint_d", "prettierd", "stylua", "black", "pylint" },
			automatic_installation = false,
			automatic_setup = true,
		},
		config = function(_, opts)
			local mason_null_ls = require("mason-null-ls")
			mason_null_ls.setup(opts)
			mason_null_ls.setup_handlers()
		end,
	},
}
