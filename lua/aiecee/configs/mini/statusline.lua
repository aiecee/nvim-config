local M = {}

function M.setup()
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

return M
