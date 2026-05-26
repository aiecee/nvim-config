local M = {}

function M.setup()
	require("mini.diff").setup({
		view = {
			style = "sign",
			signs = { add = "+", change = "~", delete = "-" },
		},
		mappings = {
			apply = "",
			reset = "",
			textobject = "",
			goto_first = "[H",
			goto_prev = "[h",
			goto_next = "]h",
			goto_last = "]H",
		},
	})
end

return M
