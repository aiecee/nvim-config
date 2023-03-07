return {
	{ "folke/trouble.nvim", config = true },
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
