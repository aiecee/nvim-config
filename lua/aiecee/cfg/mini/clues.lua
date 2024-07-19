return function()
	local clue = require("mini.clue")

	clue.setup({
		triggers = {
			{ mode = "n", keys = "<Leader>" },
			{ mode = "x", keys = "<Leader>" },
			{ mode = "n", keys = "g" },
			{ mode = "x", keys = "g" },
			{ mode = "n", keys = "z" },
			{ mode = "x", keys = "z" },
			{ mode = "n", keys = "C-w" },
			{ mode = "x", keys = "C-w" },
		},
		clues = {
			{ mode = "n", keys = "<Leader>c", desc = "+Code" },
			{ mode = "n", keys = "<Leader>f", desc = "+Files" },
			{ mode = "n", keys = "<Leader>g", desc = "+Git" },
			{ mode = "n", keys = "<Leader>m", desc = "+Marks" },
			{ mode = "n", keys = "<Leader>s", desc = "+Search" },
			{ mode = "n", keys = "<Leader>S", desc = "+Sessions" },
			{ mode = "n", keys = "<Leader>w", desc = "+Windows" },
			clue.gen_clues.g(),
			clue.gen_clues.z(),
			clue.gen_clues.windows(),
		},
		window = {
			config = {
				width = "auto",
				anchor = "SW",
			},
			delay = 0,
		},
	})

	require("aiecee.cfg.keymaps")
end
