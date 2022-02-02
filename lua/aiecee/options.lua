local global_options = {
	mapleader = " ",
	neovide_remember_window_size = true,
}

for key, value in pairs(global_options) do
	vim.g[key] = value
end

local options = {
	completeopt = { "menu", "menuone", "noselect" },
	number = true,
	relativenumber = true,
	scrolloff = 10,
	errorbells = false,
	tabstop = 2,
	softtabstop = 2,
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
	guifont = "Hack NF:h14",
}

for key, value in pairs(options) do
	vim.opt[key] = value
end
