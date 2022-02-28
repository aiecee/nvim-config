local feline = require("feline")
local telescope = require("telescope")
local telescope_themes = require("telescope.themes")
local hop = require("hop")
local harpoon = require("harpoon")
local neo_tree = require("neo-tree")

-- Neo-tree
neo_tree.setup({
	filesystem = {
		use_lubuv_file_watcher = true,
		components = {
			harpoon_index = function(config, node, state)
				local marked = require("harpoon.mark")
				local path = node:get_id()
				local success, index = pcall(marked.get_index_of, path)
				if success and index and index > 0 then
					return {
						text = string.format(" h-%d", index),
						highlight = config.highlight or "NeoTreeDirectoryIcon",
					}
				else
					return {}
				end
			end,
		},
		renderers = {
			file = {
				{ "icon" },
				{ "name", use_git_status_colors = true },
				{ "harpoon_index" },
				{ "diagnostics", highlight = "NeoTreeDimText" },
				{ "git_status", highlight = "NeoTreeDimText" },
			},
		},
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

-- Notify
vim.notify = require("notify")

-- Feline
feline.setup({
	preset = "icon",
	components = require("catppuccin.core.integrations.feline"),
})
