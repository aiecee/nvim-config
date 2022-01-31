local treesitter_install = require("nvim-treesitter.install")
treesitter_install.compilers = { "clang", "gcc" }

local treesitter_config = require("nvim-treesitter.configs")
treesitter_config.setup({
	highlight = {
		enable = true,
	},
	incremenatl_selection = {
		enable = true,
	},
	indent = {
		enable = true,
	},
	refactor = {
		highlight_definitions = {
			enable = true,
			clear_cursor_on_move = true,
		},
	},
})
