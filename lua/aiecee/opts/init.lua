local globals = require("aiecee.opts.global")
local options = require("aiecee.opts.options")

for key, value in pairs(globals) do
	vim.g[key] = value
end

for key, value in pairs(options) do
	vim.opt[key] = value
end
