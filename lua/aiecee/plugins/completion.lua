return {
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
			"hrsh7th/cmp-nvim-lsp-signature-help",
			"hrsh7th/cmp-nvim-lsp-document-symbol",
			"hrsh7th/cmp-nvim-lua",
			"hrsh7th/cmp-vsnip",
			"hrsh7th/vim-vsnip",
			"hrsh7th/vim-vsnip-integ",
			"lukas-reineke/cmp-rg",
			"rafamadriz/friendly-snippets",
			"onsails/lspkind-nvim",
			"lukas-reineke/cmp-under-comparator",
			"zbirenbaum/copilot.lua",
			"zbirenbaum/copilot-cmp",
			"amarakon/nvim-cmp-buffer-lines",
		},
		event = "InsertEnter",
		config = function()
			local cmp = require("cmp")
			local lspkind = require("lspkind")
			local under_comparator = require("cmp-under-comparator")
			local copilot_cmp = require("copilot_cmp")
			local npm_cmp = require("cmp-npm")

			npm_cmp.setup({
				only_semantic_versions = true,
			})

			copilot_cmp.setup({
				formatters = {
					insert_text = require("copilot_cmp.format").remove_existing,
				},
			})

			cmp.setup({
				sources = cmp.config.sources({
					{ name = "copilot" },
					{ name = "nvim_lsp" },
					{ name = "nvim_lsp_document_symbol" },
					{ name = "nvim_lsp_signature_help" },
					{ name = "buffer" },
					{ name = "vsnip" },
					{ name = "path" },
					{ name = "rg" },
					{ name = "nvim_lua" },
				}),
				window = {
					completion = cmp.config.window.bordered(),
					documentation = cmp.config.window.bordered(),
				},
				experimental = {
					ghost_text = true,
				},
				formatting = {
					fields = { "kind", "abbr", "menu" },
					format = lspkind.cmp_format({
						mode = "symbol_text",
						maxwidth = 40,
						ellipsis_char = "...",
						symbol_map = {
							Copilot = "",
						},
						menu = {
							nvim_lsp = "[Lsp]",
							buffer = "[Buf]",
							vsnip = "[Snp]",
							path = "[Pth]",
							rg = "[Rip]",
							copilot = "[Cop]",
							npm = "[Npm]",
						},
					}),
				},
				snippet = {
					expand = function(args)
						vim.fn["vsnip#anonymous"](args.body)
					end,
				},
				mapping = {
					["<cr>"] = cmp.mapping.confirm({
						behavior = cmp.ConfirmBehavior.Replace,
						select = false,
					}),
					["<tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_next_item({ behavior = cmp.SelectBehavior.Insert })
						else
							fallback()
						end
					end, { "i", "s" }),
					["<S-tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_prev_item({ behavior = cmp.SelectBehavior.Insert })
						else
							fallback()
						end
					end, { "i", "s" }),
					["<C-c>"] = cmp.mapping(function(_)
						cmp.complete()
					end, { "i", "s" }),
				},
				sorting = {
					priority_weight = 2,
					comparators = {
						require("copilot_cmp.comparators").prioritize,
						cmp.config.compare.offset,
						cmp.config.compare.exact,
						cmp.config.compare.recently_used,
						cmp.config.compare.score,
						under_comparator.under,
						cmp.config.compare.scopes,
						cmp.config.compare.locality,
						cmp.config.compare.kind,
						cmp.config.compare.sort_text,
						cmp.config.compare.length,
						cmp.config.compare.order,
					},
				},
			})

			cmp.setup.cmdline("/", {
				mapping = cmp.mapping.preset.cmdline(),
				sources = cmp.config.sources({
					{ name = "buffer" },
				}),
			})

			cmp.setup.cmdline(":", {
				mapping = cmp.mapping.preset.cmdline(),
				sources = cmp.config.sources({
					{ name = "path" },
					{ name = "cmdline" },
					{ name = "buffer" },
				}),
			})
		end,
	},
}
