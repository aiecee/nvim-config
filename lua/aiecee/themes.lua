local catppuccin = require("catppuccin")
local colors = require("catppuccin.api.colors").get_colors()

catppuccin.setup({
	integrations = {
		lsp_saga = true,
		hop = true,
		which_key = true,
		neotree = {
			enabled = true,
		},
	},
})

catppuccin.remap({ NeoTreeDimText = { fg = colors.gray1 }, NeoTreeGitAdded = { fg = colors.green } })

vim.cmd("colorscheme catppuccin")
