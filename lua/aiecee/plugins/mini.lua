return {
	{
		"echasnovski/mini.nvim",
		version = false,
		opts = {
			indentscope = {
				symbol = "|",
			},
			statusline = {
				content = {
					active = nil,
					inactive = nil,
				},
				use_icons = true,
				set_vim_settings = false,
			},
			move = {
				mappings = {
					left = "<C-h>",
					right = "<C-l>",
					up = "<C-k>",
					down = "<C-j>",

					line_left = "<C-h>",
					line_right = "<C-l>",
					line_up = "<C-k>",
					line_down = "<C-j>",
				},
			},
		},
		config = function(_, opts)
			require("mini.ai").setup()
			require("mini.animate").setup()
			require("mini.bracketed").setup()
			require("mini.comment").setup()
			require("mini.cursorword").setup()
			require("mini.indentscope").setup(opts.indentscope)
			require("mini.jump").setup()
			require("mini.jump2d").setup()
			require("mini.move").setup(opts.move)
			require("mini.pairs").setup()
			require("mini.statusline").setup(opts.statusline)
			require("mini.surround").setup()
		end,
	},
}
