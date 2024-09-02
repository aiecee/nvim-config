return function(opts)
	local sessions = require("ace.sessions")
	sessions:setup(opts.sessions)
end
