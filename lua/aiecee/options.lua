local utils = require("aiecee.utils")

local global_options = {
	mapleader = " ",
	neovide_remember_window_size = true,
	nvim_tree_highlight_opened_files = 1,
	nvim_tree_git_hl = 1,
  catppuccin_flavour = "frappe",
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
	guifont = utils.is_windows() and "FiraCode NF:h11" or "VictorMono Nerd Font Mono:h11",
	foldmethod = "expr",
	foldexpr = "nvim_treesitter#foldexpr()",
	foldlevelstart = 99,
	fileformat = "unix",
	laststatus = 3,
	clipboard = "unnamedplus",
}

for key, value in pairs(options) do
	vim.opt[key] = value
end
