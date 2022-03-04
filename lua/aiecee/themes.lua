local catppuccin = require("catppuccin")

catppuccin.setup({
	integrations = {
		lsp_saga = true,
		hop = true,
		which_key = true,
		nvimtree = {
			enable = true,
		},
	},
})

vim.cmd("colorscheme catppuccin")
