local tree = require("nvim-tree")
local feline = require("feline")
local telescope = require("telescope")
local telescope_themes = require("telescope.themes")
local hop = require("hop")
local harpoon = require("harpoon")

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
			theme = "cursor",
		},
		lsp_implementations = {
			theme = "cursor",
		},
		lsp_references = {
			theme = "cursor",
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
