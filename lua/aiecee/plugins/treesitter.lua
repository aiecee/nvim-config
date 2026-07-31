return {
	{
		"nvim-treesitter/nvim-treesitter",
		branch = "main",
		build = ":TSUpdate",
		cmd = {
			"TSInstall",
			"TSInstallFromGrammar",
			"TSUpdate",
			"TSUninstall",
			"TSLog",
		},
		dependencies = {
			"windwp/nvim-ts-autotag",
		},
		opts = {
			parsers = {
				"bash",
        "c_sharp",
				"css",
				"gdscript",
				"go",
				"html",
				"javascript",
				"json",
				"lua",
				"markdown",
				"markdown_inline",
				"rust",
				"tsx",
				"typescript",
				"vim",
				"vimdoc",
			},
		},
		config = function(_, opts)
			local ts = require("nvim-treesitter")
			ts.setup({})
			ts.install(opts.parsers)

			-- Main branch API: explicitly start treesitter highlighting on target filetypes.
			vim.api.nvim_create_autocmd("FileType", {
				pattern = {
					"sh",
					"bash",
					"css",
					"gdscript",
					"go",
					"html",
					"javascript",
					"javascriptreact",
					"json",
					"lua",
					"markdown",
					"rust",
					"typescript",
					"typescriptreact",
					"vim",
					"help",
				},
				callback = function(args)
					pcall(vim.treesitter.start, args.buf)
				end,
			})
		end,
	},
	{
		"windwp/nvim-ts-autotag",
		opts = {
			opts = {
				enable_close = true,
				enable_rename = true,
				enable_close_on_slash = false,
			},
		},
		config = true,
	},
}
