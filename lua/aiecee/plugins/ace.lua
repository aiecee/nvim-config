return {
	{
		"aiecee/ace.nvim",
		opts = {
			sessions = {},
		},
		config = function(_, opts)
			require("aiecee.configs.ace").setup(opts)
		end,
	},
}
