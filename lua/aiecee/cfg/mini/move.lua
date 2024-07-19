return function()
	local move = require("mini.move")

	move.setup({
		mappings = {
			left = "<S-h>",
			right = "<S-l>",
			up = "<S-k>",
			down = "<S-j>",
			line_left = "<S-h>",
			line_right = "<S-l>",
			line_up = "<S-k>",
			line_down = "<S-j>",
		},
	})
end
