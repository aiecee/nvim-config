return {
	{
		"folke/persistence.nvim",
		event = "BufReadPre",
		opts = {
			dir = vim.fn.expand(vim.fn.stdpath("data") .. "/sessions/"),
		},
	},
}
