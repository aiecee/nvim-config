return {
	{
		"catppuccin/nvim",
		lazy = false,
		priority = 1000,
		name = "catppuccin",
		opts = {
			flavour = "macchiato",
			dim_inactive = {
				enabled = true,
			},
			integrations = {
				lsp_saga = true,
				hop = true,
				which_key = true,
				neotree = true,
				mason = true,
				dap = {
					enabled = true,
					enabled_ui = true,
				},
			},
		},
		config = function(_, opts)
			require("catppuccin").setup(opts)
			vim.cmd.colorscheme("catppuccin")
		end,
	},
}
