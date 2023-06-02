return {
	{
		"catppuccin/nvim",
		lazy = false,
		priority = 1000,
		name = "catppuccin",
		opts = {
			flavour = "macchiato",
			no_italic = true, -- Force no italic
			no_bold = true, -- Force no bold
			dim_inactive = {
				enabled = true,
			},
			integrations = {
				treesitter = true,
				which_key = true,
				neotree = true,
				mason = true,
				dap = {
					enabled = true,
					enabled_ui = true,
				},
				mini = true,
			},
		},
		config = function(_, opts)
			require("catppuccin").setup(opts)
			vim.cmd.colorscheme("catppuccin")
		end,
	},
}
