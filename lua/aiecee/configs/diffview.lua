local M = {}

function M.setup(opts)
	require("diffview").setup(opts or {})
end

return M
