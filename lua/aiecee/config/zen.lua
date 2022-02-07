local zen_mode = require("zen-mode")
local twilight = require("twilight")

-- Zen Mode
zen_mode.setup({
	plugins = {
		twilight = false,
	},
})

-- Twilight
twilight.setup()
