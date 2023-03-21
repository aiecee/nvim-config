return {
	{
		"folke/trouble.nvim",
		keys = {
			{ "gq", "<cmd>TroubleToggle quickfix<cr>", desc = "quickfix" },
			{ "gw", "<cmd>TroubleToggle workspace_diagnostics<cr>", desc = "workspace diagnostics" },
			{ "gt", "<cmd>TroubleToggle<cr>", desc = "trouble" },
		},
		config = true,
	},
	{
		"folke/todo-comments.nvim",
		opts = {
			highlight = {
				pattern = [[.*<(KEYWORDS)\s*]],
			},
			search = {
				pattern = [[\b(KEYWORDS)\b]],
			},
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
	"ThePrimeagen/git-worktree.nvim",
}
