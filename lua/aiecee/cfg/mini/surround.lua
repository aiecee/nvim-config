return function()
	local surround = require("mini.surround")

	surround.setup({
		search_method = "cover_or_next",
	})
end
