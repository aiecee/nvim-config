function _G.pretty_fold_text()
	local s = vim.v.foldstart
	local e = vim.v.foldend

	local indent = string.rep(" ", vim.fn.indent(vim.v.foldstart))
	local first = vim.fn.getline(s):gsub("^%s*", "")
	local last = vim.fn.getline(e):gsub("^%s*", "")
	local count = e - s + 1
	local text = string.format("%s … %s (%d lines)", first, last, count)

	return indent .. text
end

return {
	shell = "zsh",
	completeopt = { "menu", "menuone", "noselect", "noinsert" },
	number = true,
	relativenumber = true,
	scrolloff = 10,
	errorbells = false,
	tabstop = 2,
	softtabstop = 2,
	expandtab = true,
	shiftwidth = 2,
	wrap = false,
	swapfile = false,
	backup = false,
	signcolumn = "yes",
	cmdheight = 1,
	colorcolumn = "150",
	timeoutlen = 250,
	autoread = true,
	termguicolors = true,
	guifont = "EnvyCodeR Nerd Font Mono:h14",
	foldmethod = "expr",
	foldexpr = "v:lua.vim.treesitter.foldexpr()",
	foldtext = "v:lua.pretty_fold_text()",
	fillchars = {
		fold = "-",
		foldopen = "",
		foldclose = "",
		foldsep = "│",
	},
	foldcolumn = "auto",
	foldlevelstart = 99,
	fileformat = "unix",
	laststatus = 3,
	clipboard = "unnamedplus",
	updatetime = 750,
	title = true,
	winborder = "rounded",
	pumheight = 10,
}
