local mini_clue = require("mini.clue")
local clue_config = {
	triggers = {
		{ mode = "n", keys = "<Leader>" },
		{ mode = "x", keys = "<Leader>" },
		{ mode = "n", keys = "g" },
		{ mode = "x", keys = "g" },
	},
	clues = {
		{ mode = "n", keys = "<Leader>c", desc = "+Code" },
		{ mode = "n", keys = "<Leader>f", desc = "+Files" },
		{ mode = "n", keys = "<Leader>g", desc = "+Git" },
		{ mode = "n", keys = "<Leader>m", desc = "+Marks" },
		{ mode = "n", keys = "<Leader>s", desc = "+Search" },
		{ mode = "n", keys = "<Leader>S", desc = "+Sessions" },
		{ mode = "n", keys = "<Leader>w", desc = "+Windows" },
		mini_clue.gen_clues.g(),
		mini_clue.gen_clues.windows(),
	},
	window = {
		config = {
			width = "auto",
			anchor = "SW",
		},
		delay = 0,
	},
}
mini_clue.setup(clue_config)

require("aiecee.config.keymaps")
