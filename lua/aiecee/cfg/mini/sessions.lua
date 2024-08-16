return function()
	local sessions = require("mini.sessions")

	sessions.setup()

	local augroup = vim.api.nvim_create_augroup("MyMiniSessions", {})
	vim.api.nvim_create_autocmd("VimEnter", {
		group = augroup,
		callback = function()
			local data_dir = vim.fn.stdpath("data") .. "/session/"
			local cwd = vim.fn.getcwd():gsub("/", "-"):gsub("%.", "-"):sub(2)
			vim.v.this_session = data_dir .. cwd .. ".vim"
		end,
		desc = "",
	})
end
