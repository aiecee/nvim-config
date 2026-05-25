local M = {}

function M.setup(opts)
	local sessions = require("ace.sessions")
	opts = opts or {}
	sessions:setup(opts.sessions or {})
end

return M
