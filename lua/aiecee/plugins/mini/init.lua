return {
	{
		"echasnovski/mini.nvim",
		version = false,
		config = function()
			require("mini.ai").setup()
			require("mini.animate").setup()
			require("aiecee.plugins.mini.base16")
			require("mini.bracketed").setup()
			require("aiecee.plugins.mini.clues")
			require("mini.comment").setup()
			require("mini.cursorword").setup()
			require("aiecee.plugins.mini.files")
			require("aiecee.plugins.mini.indentscope")
			require("mini.jump").setup()
			require("mini.jump2d").setup()
			require("aiecee.plugins.mini.move")
			require("mini.pairs").setup()
			require("aiecee.plugins.mini.statusline")
			require("mini.surround").setup()
		end,
	},
}
