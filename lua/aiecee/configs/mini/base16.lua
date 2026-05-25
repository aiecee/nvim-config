local M = {}

function M.setup()
	local base16 = require("mini.base16")
	local themes = require("aiecee.configs.themes")

	base16.setup({
		palette = themes.palettes.jabuti,
		use_cterm = true,
	})

	vim.cmd([[highlight link FloatBorder FloatTitle]])
end

return M
