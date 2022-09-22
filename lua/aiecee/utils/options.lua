local M = {}

function M.set_global(key, value)
	vim.g[key] = value
end

function M.set_globals(table)
	for key, value in pairs(table) do
		M.set_global(key, value)
	end
end

function M.set_opt(key, value)
	vim.opt[key] = value
end

function M.set_opts(table)
	for key, value in pairs(table) do
		M.set_opt(key, value)
	end
end

return M
