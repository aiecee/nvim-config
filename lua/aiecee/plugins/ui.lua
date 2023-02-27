return {
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v2.x",
		dependencies = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim", "kyazdani42/nvim-web-devicons" },
		opts = {
			popup_border_style = "rounded",
			filesystem = {
				follow_current_file = true,
			},
			window = {
				mappings = {
					["T"] = "toggle_node",
					["<space>"] = "",
				},
				position = "float",
			},
		},
		config = true,
	},
	{
		"rcarriga/nvim-notify",
		config = function()
			vim.notify = require("notify")
		end,
	},
}
