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
		},
		config = function(_, opts)
			require("mini.animate").setup()
			require("mini.bracketed").setup()
			require("mini.comment").setup()
			require("mini.cursorword").setup()
			require("mini.indentscope").setup(opts.indentscope)
			require("mini.jump").setup()
			require("mini.jump2d").setup()
			require("mini.pairs").setup()
			require("mini.statusline").setup(opts.statusline)
			require("mini.surround").setup()
		end,
	},
}
