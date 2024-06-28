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
			require("mini.cursorword").setup()
			require("aiecee.plugins.mini.files")
			require("aiecee.plugins.mini.indentscope")
			require("mini.jump").setup()
			require("mini.jump2d").setup()
			require("aiecee.plugins.mini.move")
			require("aiecee.plugins.mini.notify")
			require("mini.pairs").setup()
			require("aiecee.plugins.mini.statusline")
			require("mini.surround").setup({
				search_method = "cover_or_next",
			})
			local hipatterns = require("mini.hipatterns")
			hipatterns.setup({
				highlighters = {
					-- Highlight standalone 'FIXME', 'HACK', 'TODO', 'INFO'
					fixme = { pattern = "%f[%w]()FIXME()%f[%W]", group = "MiniHipatternsFixme" },
					hack = { pattern = "%f[%w]()HACK()%f[%W]", group = "MiniHipatternsHack" },
					todo = { pattern = "%f[%w]()TODO()%f[%W]", group = "MiniHipatternsTodo" },
					info = { pattern = "%f[%w]()INFO()%f[%W]", group = "MiniHipatternsNote" },

					-- Highlight hex color strings (`#rrggbb`) using that color
					hex_color = hipatterns.gen_highlighter.hex_color(),
				},
			})
		end,
	},
}
