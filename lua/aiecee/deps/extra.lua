return {
	{ "ThePrimeagen/harpoon", branch = "harpoon2", dependencies = { "nvim-lua/plenary.nvim" } },
	{
		"aiecee/ace.nvim",
		opts = {
			sessions = {},
		},
		config = require("aiecee.cfg.ace"),
	},
}
