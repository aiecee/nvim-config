return {
	{
		"echasnovski/mini.nvim",
		lazy = false,
		priority = 1000,
		dependencies = { "rafamadriz/friendly-snippets" },
		version = false,
		config = function()
			require("aiecee.configs.mini").setup()
		end,
	},
}
