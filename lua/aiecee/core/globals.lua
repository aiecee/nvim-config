local M = {}

local globals = {
	mapleader = " ",
	maplocalleader = "\\",
}

function M.setup()
	for key, value in pairs(globals) do
		vim.g[key] = value
	end
end

return M
