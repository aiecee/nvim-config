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
		lazy = false,
		dependencies = { "folke/snacks.nvim", "onsails/lspkind.nvim", "folke/lazydev.nvim", "stevearc/conform.nvim" },
		config = function()
			require("aiecee.config.code.lsps")
			require("aiecee.config.code.diagnostics")
		end,
	},
}
