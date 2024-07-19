return {
	{ "williamboman/mason.nvim", opts = { ui = { border = "rounded" } }, config = true },
	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = { "neovim/nvim-lspconfig", "folke/neodev.nvim" },
		opts = function()
			local neo_dev = require("neodev")
			neo_dev.setup()

			local cssls = require("aiecee.cfg.lsp.cssls")
			local eslint = require("aiecee.cfg.lsp.eslint")
			local gopls = require("aiecee.cfg.lsp.go")
			local html = require("aiecee.cfg.lsp.html")
			local jsonls = require("aiecee.cfg.lsp.jsonls")
			local lua_ls = require("aiecee.cfg.lsp.lua-ls")
			local tailwindcss = require("aiecee.cfg.lsp.tailwindcss")
			local theme_check = require("aiecee.cfg.lsp.theme-check")
			local tsserver = require("aiecee.cfg.lsp.tsserver")
			local volar = require("aiecee.cfg.lsp.vue")

			local function add_server(table, server)
				table[server.mason_name] = {
					settings = server.settings,
					on_attach = server.on_attach,
				}
			end

			local servers = {}
			add_server(servers, cssls)
			add_server(servers, eslint)
			add_server(servers, gopls)
			add_server(servers, html)
			add_server(servers, jsonls)
			add_server(servers, lua_ls)
			add_server(servers, tailwindcss)
			add_server(servers, theme_check)
			add_server(servers, tsserver)
			add_server(servers, volar)
			return servers
		end,
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
		"nvimtools/none-ls.nvim",
		opts = function()
			local builtins = require("null-ls").builtins
			local augroup = vim.api.nvim_create_augroup("lsp_formatting", {})
			return {
				sources = {
					-- prettierd
					builtins.formatting.prettierd,
					-- Stylua
					builtins.formatting.stylua,
					-- black
					builtins.formatting.black,
					-- pylint
					builtins.diagnostics.pylint,
				},
				on_attach = function(client, bufnr)
					local filepath = vim.api.nvim_buf_get_name(bufnr)
					local file_extension = vim.fn.fnamemodify(filepath, ":e")
					if file_extension == "kts" then
						return
					end

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
		"jay-babu/mason-null-ls.nvim",
		opts = {
			ensure_installed = { "prettierd", "stylua", "black", "pylint", "tsc" },
			automatic_installation = true,
			automatic_setup = true,
		},
		config = function(_, opts)
			local mason_null_ls = require("mason-null-ls")
			mason_null_ls.setup(opts)
		end,
	},
}
