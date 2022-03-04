local feline = require("feline")
local telescope = require("telescope")
local telescope_themes = require("telescope.themes")
local hop = require("hop")
local harpoon = require("harpoon")
local nvim_tree = require("nvim-tree")

-- Nvim-tree
nvim_tree.setup({
	hijack_cursor = true,
	diagnostics = {
		enable = true,
	},
	update_focused_file = {
		enable = true,
	},
	view = {
		width = 45,
	},
})

-- Harpoon
harpoon.setup()

-- Hop
hop.setup()

-- Telescope
telescope.setup({
	defaults = {
		mappings = {
			i = {
				["<C-h>"] = require("telescope").extensions.hop.hop,
			},
		},
	},
	pickers = {
		find_files = {
			theme = "dropdown",
		},
		buffers = {
			theme = "dropdown",
		},
		lsp_definitions = {
			theme = "dropdown",
		},
		lsp_implementations = {
			theme = "dropdown",
		},
		lsp_references = {
			theme = "dropdown",
		},
		diagnostics = {
			theme = "dropdown",
		},
	},
	extensions = {
		["ui-select"] = {
			telescope_themes.get_dropdown(),
		},
	},
})

telescope.load_extension("harpoon")
telescope.load_extension("ui-select")
telescope.load_extension("hop")
telescope.load_extension("file_browser")
telescope.load_extension("todo-comments")

-- Notify
vim.notify = require("notify")

-- Feline
feline.setup({
	preset = "icon",
	components = require("catppuccin.core.integrations.feline"),
})
