local wk = require("which-key")

local function map(mode, lhs, rhs, opts)
	local options = { noremap = true }
	if opts then
		options = vim.tbl_extend("force", options, opts)
	end
	vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

map("i", "<C-h>", ":HopLine<cr>")
map("n", "<C-h>", ":HopLine<cr>")
map("v", "<C-h>", ":HopLine<cr>")

-- Normal Mode
wk.register({
	["-"] = { "<cmd>Telescope commands<cr>", "commands" },
	f = {
		name = "File",
		s = { "<cmd>w<cr>", "save" },
		a = { "<cmd>wa<cr>", "save all" },
		f = { "<cmd>Telescope find_files<cr>", "find file" },
		b = { "<cmd>Telescope file_browser<cr>", "file browser" },
		g = { "<cmd>Telescope live_grep<cr>", "grep file" },
		r = { "<cmd>Telescope oldfiles<cr>", "recently opened" },
	},
	t = {
		name = "Tree",
		t = { "<cmd>NvimTreeToggle<cr>", "toggle" },
		f = { "<cmd>NvimTreeFocus<cr>", "focus" },
		j = { "<cmd>NvimTreeFindFile<cr>", "jump to file" },
		r = { "<cmd>NvimTreeRefresh<cr>", "refresh tree" },
	},
	b = {
		name = "Buffers",
		l = { "<cmd>Telescope buffers<cr>", "list" },
		c = { "<cmd>bd<cr>", "close current" },
		n = { "<cmd>bn<cr>", "next" },
		p = { "<cmd>bp<cr>", "previous" },
	},
	x = {
		name = "Exit",
		q = { "<cmd>q<cr>", "quit" },
		s = { "<cmd>wq<cr>", "save and quit" },
		x = { "<cmd>qa<cr>", "exit" },
	},
	c = {
		name = "Code",
		b = { "<cmd>Telescope lsp_definitions<cr>", "go to definition" },
		i = { "<cmd>Telescope lsp_implementations<cr>", "go to implementations" },
		r = { "<cmd>Telescope lsp_references<cr>", "all references" },
		d = {
			name = "Diagnostics",
			b = { "<cmd>Telescope diagnostics<cr>", "buffer diagnostics" },
			l = { "<cmd>lua require('lspsaga.diagnostic').show_line_diagnostics()<cr>", "line diagnostics" },
			c = { "<cmd>lua require('lspsaga.diagnostic').show_cursor_diagnostics()<cr>", "cursor diagnostics" },
		},
		--f = { "<cmd>lua vim.lsp.buf.formatting_sync(nil, 2000)<cr>", "format" },
		f = { "<cmd>Neoformat<cr>", "format" },
		a = { "<cmd>lua require('lspsaga.codeaction').code_action()<cr>", "code actions" },
		R = { "<cmd>lua require('lspsaga.rename').rename()<cr>", "rename" },
		h = { "<cmd>lua require('lspsaga.hover').render_hover_doc()<cr>", "hover" },
		s = { "<cmd>lua require('lspsaga.signaturehelp').signature_help()<cr>", "signature help" },
	},
	g = {
		name = "Git",
		c = {
			name = "Commits",
			c = { "<cmd>Telescope git_commits<cr>", "commits" },
			b = { "<cmd>Telescope git_bcommits<cr>", "buffer commits" },
		},
		b = { "<cmd>Telescope git_branches<cr>", "branches" },
		s = { "<cmd>Telescope git_status<cr>", "status" },
		f = { "<cmd>Telescope git_files<cr>", "files" },
	},
	s = {
		name = "Search",
		f = { "<cmd>Telescope current_buffer_fuzzy_find<cr>", "current file" },
		w = { "<cmd>Telescope grep_string<cr>", "current working dir" },
	},
	w = {
		name = "Window",
		["="] = { "<cmd>wincmd =<cr>", "format windows" },
		h = { "<cmd>wincmd h<cr>", "go to the left window" },
		j = { "<cmd>wincmd j<cr>", "go to the down window" },
		k = { "<cmd>wincmd k<cr>", "go to the up window" },
		l = { "<cmd>wincmd l<cr>", "go to the right window" },
		w = { "<cmd>wincmd w<cr>", "switch windows" },
		s = { "<cmd>wincmd w<cr>", "split window" },
		v = { "<cmd>wincmd v<cr>", "split window vertically" },
		q = { "<cmd>wincmd q<cr>", "quit window" },
		x = { "<cmd>wincmd x<cr>", "swap windows" },
	},
	z = {
		name = "Zen Mode",
		t = { "<cmd>Twilight<cr>", "toggle twilight" },
		z = { "<cmd>ZenMode<cr>", "toggle zen mode" },
	},
	m = {
		name = "Marks",
		a = { "<cmd>lua require('harpoon.mark').add_file()<cr>", "add file" },
		n = { "<cmd>lua require('harpoon.ui').nav_next()<cr>", "next" },
		p = { "<cmd>lua require('harpoon.ui').nav_prev()<cr>", "previous" },
		l = { "<cmd>Telescope harpoon marks theme=dropdown<cr>", "list" }, -- theme needs to be set here, can't do it in config
	},
	h = {
		name = "Hop",
		w = { "<cmd>HopWord<cr>", "word" },
		l = { "<cmd>HopLine<cr>", "line" },
		p = { "<cmd>HopPattern<cr>", "pattern" },
	},
}, {
	prefix = "<leader>",
})

-- Visual Mode
wk.register({
	n = {
		name = "Navigation",
		b = {
			name = "Buffer",
			w = { "<cmd>HopWord<cr>", "word" },
			l = { "<cmd>HopLine<cr>", "line" },
			p = { "<cmd>HopPattern<cr>", "pattern" },
		},
	},
}, { mode = "v" })
