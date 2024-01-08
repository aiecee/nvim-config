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
			extra_parsers = {
				liquid = {
					install_info = {
						url = "https://github.com/Shopify/tree-sitter-liquid",
						files = { "src/parser.c" },
						branch = "main",
						requires_generate_from_grammar = true,
					},
					filetype = "liquid",
				},
			},
		},
		config = function(_, opts)
			local install = require("nvim-treesitter.install")
			local config = require("nvim-treesitter.configs")
			local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
			for k, v in pairs(opts.extra_parsers) do
				parser_config[k] = v
			end
			install.compilers = opts.compilers
			config.setup(opts.settings)
			install.update({ with_sync = true })
		end,
	},
}
