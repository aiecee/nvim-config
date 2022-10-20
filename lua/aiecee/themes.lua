local catppuccin = require("catppuccin")

catppuccin.setup({
	dim_inactive = {
		enabled = true,
	},
	integrations = {
		lsp_saga = true,
		hop = true,
		which_key = true,
		neotree = {
			enable = true,
		},
	},
})

vim.api.nvim_command("colorscheme catppuccin")
