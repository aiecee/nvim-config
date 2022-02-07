local autopairs = require("nvim-autopairs")
local treesitter_install = require("nvim-treesitter.install")
local treesitter_config = require("nvim-treesitter.configs")
local indent_blankline = require("indent_blankline")

-- Autopairs
autopairs.setup()

-- Neoformat
vim.cmd([[
	augroup lsp_formatting
		autocmd! * <buffer>
		autocmd BufWritePre * undojoin | Neoformat
	augroup END
]])

-- Treesitter
treesitter_install.compilers = { "clang", "gcc" }
treesitter_config.setup({
	highlight = {
		enable = true,
	},
	incremenatl_selection = {
		enable = true,
	},
	indent = {
		enable = true,
	},
	refactor = {
		highlight_definitions = {
			enable = true,
			clear_cursor_on_move = true,
		},
	},
})

-- Indent-blankline
indent_blankline.setup({
	show_current_context = true,
	show_current_context_start = true,
})
