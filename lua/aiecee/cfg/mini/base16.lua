return function()
	local base16 = require("mini.base16")
	local themes = require("aiecee.cfg.themes")

	base16.setup({
		palette = themes.stella,
		use_cterm = true,
	})

	vim.cmd([[highlight link FloatBorder FloatTitle]])
end
