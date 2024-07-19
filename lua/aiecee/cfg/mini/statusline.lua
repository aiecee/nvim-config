return function()
	local statusline = require("mini.statusline")

	statusline.setup({
		content = {
			active = nil,
			inactive = nil,
		},
		use_icons = true,
		set_vim_settings = false,
	})
end
