---@diagnostic disable: missing-fields
return function()
	local install = require("nvim-treesitter.install")
	local config = require("nvim-treesitter.configs")
	install.compilers = { "clang", "gcc" }
	config.setup({
		ensure_installed = {
			"lua",
			"typescript",
			"javascript",
			"tsx",
			"markdown",
			"json",
			"css",
			"scss",
			"html",
			"liquid",
			"vue",
			"yaml",
		},
		highlight = {
			enable = true,
		},
		incremental_selection = {
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
			highlight_current_scope = {
				enable = false,
			},
		},
	})
	install.update({ with_sync = true })
end
