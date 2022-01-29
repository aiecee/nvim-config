vim.g.mapleader = ' '

local options = {
	completeopt = { 'menu', 'menuone', 'noselect' },
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
	signcolumn = 'yes',
	cmdheight = 1,
	colorcolumn = '150',
	timeoutlen = 250,
	autoread = true,
	termguicolors = true,
	guifont = 'Lilex NF:h14'
}

for key, value in pairs(options) do
	vim.opt[key] = value
end
