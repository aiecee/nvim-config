return {
	{
		"folke/lazydev.nvim",
		ft = "lua", -- only load on lua files
		opts = {
			cmp = false,
		},
		config = true,
	},
	{
		"saghen/blink.cmp",
		dependencies = "rafamadriz/friendly-snippets",
		version = "v0.6.2",
		opts = {
			keymap = {
				["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
				["<CR>"] = {
					function(cmp)
						if cmp.is_in_snippet() then
							return cmp.accept()
						else
							return cmp.select_and_accept()
						end
					end,
					"snippet_forward",
					"fallback",
				},
				["<S-Tab>"] = { "select_prev", "fallback" },
				["<Tab>"] = { "select_next", "fallback" },
				["<C-k>"] = { "scroll_documentation_up", "fallback" },
				["<C-j>"] = { "scroll_documentation_down", "fallback" },
			},

			highlight = {
				use_nvim_cmp_as_default = true,
			},
			nerd_font_variant = "mono",
			sources = {
				completion = {
					enabled_providers = { "lsp", "path", "snippets", "buffer" },
				},
			},
			accept = { auto_brackets = { enabled = true } },
			trigger = { signature_help = { enabled = true } },
			windows = {
				documentation = {
					auto_show = true,
				},
			},
		},
		opts_extend = { "sources.completion.enabled_providers" },
	},
	{ "williamboman/mason.nvim", opts = { ui = { border = "rounded" } }, config = true },
	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = { "neovim/nvim-lspconfig", "saghen/blink.cmp" },
		opts = require("aiecee.cfg.lsps"),
		config = function(_, servers)
			local mason_lspconfig = require("mason-lspconfig")
			local lsp_config = require("lspconfig")
			local blink = require("blink.cmp")

			mason_lspconfig.setup({
				ensure_installed = vim.tbl_keys(servers),
			})

			mason_lspconfig.setup_handlers({
				function(server_name)
					local server_config = servers[server_name]
					if server_config == nil then
						return
					end

					local capabilities = vim.lsp.protocol.make_client_capabilities()
					capabilities = blink.get_lsp_capabilities(capabilities)

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
			-- zig
			ft("zig"):fmt("zigfmt")

			vim.g.guard_config = {
				fmt_on_save = true,
				lsp_as_default_formatter = true,
			}
		end,
	},
}
