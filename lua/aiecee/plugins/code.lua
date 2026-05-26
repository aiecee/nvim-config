return {
	{
		"folke/trouble.nvim",
		-- TODO - move these elsewhere
		keys = {
			{ "gq", "<cmd>Trouble quickfix toggle<cr>", desc = "quickfix" },
			{ "gw", "<cmd>Trouble diagnostics toggle<cr>", desc = "workspace diagnostics" },
			{ "gt", "<cmd>Trouble toggle<cr>", desc = "trouble" },
		},
		config = true,
	},
	{
		"sindrets/diffview.nvim",
		cmd = {
			"DiffviewOpen",
			"DiffviewFileHistory",
			"DiffviewClose",
			"DiffviewRefresh",
			"DiffviewToggleFiles",
			"DiffviewFocusFiles",
			"DiffviewLog",
		},
		opts = {},
		config = function(_, opts)
			require("aiecee.configs.diffview").setup(opts)
		end,
	},
	{
		"stevearc/conform.nvim",
		keys = {
			{
				"<Leader>cf",
				function()
					require("conform").format({ bufnr = vim.api.nvim_get_current_buf() })
				end,
				mode = "n",
				desc = "format",
			},
		},
		opts = {
			formatters_by_ft = {
				lua = { "stylua" },
				typescript = { "oxfmt", "oxlint", "biome-check", "prettier" },
				typescriptreact = { "oxfmt", "oxlint", "biome-check", "prettier" },
				javascript = { "oxfmt", "oxlint", "biome-check", "prettier" },
				javascriptreact = { "oxfmt", "oxlint", "biome-check", "prettier" },
				css = { "oxfmt", "oxlint" },
				json = { "oxfmt", "oxlint", "biome-check", "prettier" },
				astro = { "biome-check", "prettier" },
				yaml = { "oxfmt", "oxlint", "biome-check", "prettier" },
				toml = { "oxfmt", "oxlint", "biome-check", "prettier" },
				zig = { "zigfmt" },
				go = { "gofmt", "goimports", "golangci-lint" },
			},
			format_on_save = {
				lsp_format = "fallback",
				timeout_ms = 1000,
			},
		},
		config = true,
	},
}
