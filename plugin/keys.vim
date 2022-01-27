lua << EOF

local wk = require("which-key")

wk.setup({
	window = {
		border = 'single'
	}
})
wk.register({
	["-"] = { "<cmd>Telescope commands<cr>", "commands" }, 
	f = {
		name = "Files",
		f = { "<cmd>Telescope find_files<cr>", "find file" },
		g = { "<cmd>Telescope live_grep<cr>", "grep file" },
		r = { "<cmd>Telescope oldfiles<cr>", "recently opened" },
		s = { "<cmd>w<cr>", "save" },
		a = { "<cmd>wa<cr>", "save all" },
	},
	t = {
		name = "Tree",
		t = { "<cmd>NvimTreeToggle<cr>", "toggle" },
		f = { "<cmd>NvimTreeFocus<cr>", "focus" },
		j = { "<cmd>NvimTreeFindFile<cr>", "jump to file" },
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
			l = { "<cmd>Lspsaga show_line_diagnostics<cr>", "line diagnostics" },
			c = { "<cmd>Lspsaga show_cursor_diagnostics<cr>", "cursor diagnostics" },
		},
		f = { "<cmd>Neoformat<cr>", "format" },
		a = { "<cmd>Lspsaga code_actions<cr>", "code actions" },
		R = { "<cmd>Lspsaga rename<cr>", "rename" },
		h = { "<cmd>Lspsaga hover_doc<cr>", "hover" },
		s = { "<cmd>Lspsaga signature_help<cr>", "signature help" },
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
	}
},
{
	prefix = "<leader>"
})
EOF
