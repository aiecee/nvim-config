return {
	"folke/which-key.nvim",
	opts = {
		window = {
			border = "rounded",
		},
		layout = {
			spacing = 6,
			align = "center",
		},
	},
	config = function(_, opts)
		local wk = require("which-key")
		wk.setup(opts)
		require("aiecee.config.keymaps")
	end,
}
