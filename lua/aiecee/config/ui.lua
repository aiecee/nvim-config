local tree = require("nvim-tree")
local feline = require("feline")

-- Nvim tree
tree.setup({
	hijack_cursor = true,
	update_focused_file = {
		enable = true,
	},
	diagnostics = {
		enable = true,
		show_on_dirs = true,
	},
	view = {
		width = "20%",
		auto_resize = true,
		side = "right",
	},
})

-- Notify
vim.notify = require("notify")

-- Feline
feline.setup({
	preset = "icon",
	components = require("catppuccin.core.integrations.feline"),
})
