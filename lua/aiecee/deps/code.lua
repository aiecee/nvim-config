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
		"lewis6991/gitsigns.nvim",
		opts = {
			current_line_blame = true,
		},
		config = true,
	},
}
