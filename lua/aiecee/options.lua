local utils = require("aiecee.utils.options")

local global_options = {
	mapleader = " ",
	neovide_remember_window_size = true,
	nvim_tree_highlight_opened_files = 1,
	nvim_tree_git_hl = 1,
}

utils.set_globals(global_options)

local options = {
	shell = "zsh",
	completeopt = { "menu", "menuone", "preview", "noselect" },
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
	guifont = "VictorMono Nerd Font Mono:h12",
	foldmethod = "expr",
	foldexpr = "nvim_treesitter#foldexpr()",
	foldlevelstart = 99,
	fileformat = "unix",
	laststatus = 3,
	clipboard = "unnamedplus",
	updatetime = 750,
	title = true,
}

utils.set_opts(options)
