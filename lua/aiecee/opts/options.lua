return {
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
	guifont = "0xProto Nerd Font Mono:h13",
	foldmethod = "expr",
	foldexpr = "v:lua.vim.treesitter.foldexpr()",
	foldtext = "",
	fillchars = "fold:·,foldopen:▾,foldclose:▸",
	foldlevelstart = 99,
	fileformat = "unix",
	laststatus = 3,
	clipboard = "unnamedplus",
	updatetime = 750,
	title = true,
}
