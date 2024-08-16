return {
	-- { dir = "~/projects/myllama.nvim" },
	-- { dir = "~/projects/sesh.nvim", opts = {}, config = true },
	{
		dir = "~/projects/ace.nvim",
		config = function()
			local sessions = require("ace.sessions")
			sessions.setup()
		end,
	},
}
