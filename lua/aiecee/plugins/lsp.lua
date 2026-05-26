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
		opts = {},
		config = function(_, opts)
			require("lspkind").init(opts)
		end,
	},
	{
		"neovim/nvim-lspconfig",
		lazy = false,
		cmd = {
			"LspInfo",
			"LspLog",
			"LspStart",
			"LspRestart",
			"LspStop",
		},
		dependencies = { "folke/snacks.nvim", "onsails/lspkind.nvim", "folke/lazydev.nvim", "stevearc/conform.nvim" },
		config = function()
			require("aiecee.configs.lsp").setup()
			require("aiecee.configs.lsp.diagnostics").setup()
		end,
	},
}
