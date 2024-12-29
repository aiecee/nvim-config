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
		"zbirenbaum/copilot.lua",
		opts = {
			suggestion = { enabled = false },
			panel = { enabled = false },
		},
	},
	{
		"giuxtaposition/blink-cmp-copilot",
		dependencies = {
			"zbirenbaum/copilot.lua",
		},
	},
	{
		"saghen/blink.cmp",
		dependencies = { "rafamadriz/friendly-snippets", "giuxtaposition/blink-cmp-copilot" },
		version = "v0.*",
		opts = {
			keymap = {
				["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
				["<Esc>"] = { "hide", "fallback" },
				["<CR>"] = {
					function(cmp)
						print(vim.inspect(cmp))
						print(vim.inspect(cmp.snippet_active()))
						if cmp.snippet_active() then
							return cmp.accept()
						else
							return cmp.select_and_accept()
						end
					end,
					"snippet_forward",
					"fallback",
				},
				["<S-Tab>"] = { "select_prev", "snippet_backward", "fallback" },
				["<Tab>"] = { "select_next", "snippet_forward", "fallback" },
				["<Up>"] = { "select_prev", "fallback" },
				["<Down>"] = { "select_next", "fallback" },
				["<C-k>"] = { "scroll_documentation_up", "fallback" },
				["<C-j>"] = { "scroll_documentation_down", "fallback" },
			},
			completion = {
				accept = { auto_brackets = { enabled = true } },
				menu = {
					auto_show = function(ctx)
						return ctx.mode ~= "cmdline"
					end,
					border = "single",
				},
				documentation = {
					auto_show = true,
					window = { border = "single" },
				},
				list = {
					selection = "auto_insert",
				},
			},
			signature = {
				enabled = true,
				window = { border = "single" },
			},
			sources = {
				default = { "lsp", "path", "snippets", "buffer", "copilot" },
				providers = {
					copilot = {
						name = "copilot",
						module = "blink-cmp-copilot",
						score_offset = 100,
						transform_items = function(_, items)
							local CompletionItemKind = require("blink.cmp.types").CompletionItemKind
							local kind_idx = #CompletionItemKind + 1
							CompletionItemKind[kind_idx] = "Copilot"
							for _, item in ipairs(items) do
								item.kind = kind_idx
							end
							return items
						end,
						async = true,
					},
				},
			},
			appearance = {
				nerd_font_variant = "mono",
				use_nvim_cmp_as_default = true,
				-- Blink does not expose its default kind icons so you must copy them all (or set your custom ones) and add Copilot
				kind_icons = {
					Copilot = "",
					Text = "󰉿",
					Method = "󰊕",
					Function = "󰊕",
					Constructor = "󰒓",

					Field = "󰜢",
					Variable = "󰆦",
					Property = "󰖷",

					Class = "󱡠",
					Interface = "󱡠",
					Struct = "󱡠",
					Module = "󰅩",

					Unit = "󰪚",
					Value = "󰦨",
					Enum = "󰦨",
					EnumMember = "󰦨",

					Keyword = "󰻾",
					Constant = "󰏿",

					Snippet = "󱄽",
					Color = "󰏘",
					File = "󰈔",
					Reference = "󰬲",
					Folder = "󰉋",
					Event = "󱐋",
					Operator = "󰪚",
					TypeParameter = "󰬛",
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
				automatic_installation = true,
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
		"stevearc/conform.nvim",
		opts = {
			formatters_by_ft = {
				lua = { "stylua" },
				typescript = { "prettier" },
				typescriptreact = { "prettier" },
				javascript = { "prettier" },
				javascriptreact = { "prettier" },
				yaml = { "prettier" },
				json = { "prettier" },
				toml = { "prettier" },
				zig = { "zigfmt" },
				-- ["*"] = { "codespell" },
			},
			format_on_save = {
				lsp_format = "fallback",
				timeout_ms = 1000,
			},
		},
	},
}
