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
		"onsails/lspkind.nvim",
		config = function()
			require("lspkind").init({})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = { "folke/snacks.nvim", "onsails/lspkind.nvim", "folke/lazydev.nvim" },
		config = function()
			require("aiecee.config.code.lsps")
			require("aiecee.config.code.diagnostics")
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
				astro = { "prettier" },
				yaml = { "prettier" },
				json = { "prettier" },
				toml = { "prettier" },
				zig = { "zigfmt" },
			},
			format_on_save = {
				lsp_format = "fallback",
				timeout_ms = 1000,
			},
		},
	},
}
