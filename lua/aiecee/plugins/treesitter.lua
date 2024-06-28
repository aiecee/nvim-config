return {
	{
		"nvim-treesitter/nvim-treesitter",
		dependencies = {
			"nvim-treesitter/nvim-treesitter-refactor",
			"nvim-treesitter/nvim-treesitter-context",
			"windwp/nvim-ts-autotag",
		},
		opts = {
			compilers = { "clang", "gcc" },
			settings = {
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
			},
		},
		config = function(_, opts)
			local install = require("nvim-treesitter.install")
			local config = require("nvim-treesitter.configs")
			install.compilers = opts.compilers
			config.setup(opts.settings)
			install.update({ with_sync = true })
		end,
	},
}
