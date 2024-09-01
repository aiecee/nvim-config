return {
	{ "ThePrimeagen/harpoon", branch = "harpoon2", dependencies = { "nvim-lua/plenary.nvim" } },
	{
		"aiecee/ace.nvim",
		opts = {},
		config = function(opts)
			local sessions = require("ace.sessions")
			sessions:setup(opts)
		end,
	},
}
