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
				typescript = { "oxfmt", "biome-check", "prettier", stop_after_first = true },
				typescriptreact = { "oxfmt", "biome-check", "prettier", stop_after_first = true },
				javascript = { "oxfmt", "biome-check", "prettier", stop_after_first = true },
				javascriptreact = { "oxfmt", "biome-check", "prettier", stop_after_first = true },
				css = { "oxfmt" },
				json = { "oxfmt", "biome-check", "prettier", stop_after_first = true },
				astro = { "biome-check", "prettier", stop_after_first = true },
				yaml = { "oxfmt", "biome-check", "prettier", stop_after_first = true },
				toml = { "oxfmt", "biome-check", "prettier", stop_after_first = true },
				zig = { "zigfmt" },
				go = { "gofmt", "goimports", "golangci-lint" },
        cs = { "csharpier" },
			},
			format_on_save = {
				lsp_format = "fallback",
				timeout_ms = 1000,
			},
		},
		config = true,
	},
}
