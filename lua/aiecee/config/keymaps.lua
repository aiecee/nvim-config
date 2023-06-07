local wk = require("which-key")

local function map(mode, lhs, rhs, opts)
	local options = { noremap = true }
	if opts then
		options = vim.tbl_extend("force", options, opts)
	end
	vim.keymap.set(mode, lhs, rhs, options)
end

-- Quickfix
map("n", "<C-q>t", "<cmd>cw<cr>")
map("i", "<C-q>t", "<cmd>cw<cr>")
map("n", "<C-q>n", "<cmd>cn<cr>")
map("i", "<C-q>n", "<cmd>cn<cr>")
map("n", "<C-q>p", "<cmd>cp<cr>")
map("i", "<C-q>p", "<cmd>cp<cr>")
map("n", "<C-q>c", "<cmd>cexpr []<cr>")
map("i", "<C-q>c", "<cmd>cexpr []<cr>")

-- Normal Mode
wk.register({
	["-"] = { "<cmd>Telescope commands<cr>", "commands" },
	f = {
		name = "File",
		s = { "<cmd>w<cr>", "save" },
		a = { "<cmd>wa<cr>", "save all" },
		f = { "<cmd>Telescope find_files<cr>", "find file" },
		b = { "<cmd>Telescope file_browser<cr>", "file browser" },
		r = { "<cmd>Telescope oldfiles<cr>", "recently opened" },
	},
	t = {
		name = "Tree",
		t = { "<cmd>Neotree toggle<cr>", "toggle" },
		f = { "<cmd>Neotree focus<cr>", "focus" },
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
	g = {
		name = "Git",
		c = {
			name = "Commits",
			c = { "<cmd>Telescope git_commits<cr>", "commits" },
			b = { "<cmd>Telescope git_bcommits<cr>", "buffer commits" },
		},
		b = { "<cmd>Telescope git_branches<cr>", "branches" },
		s = { "<cmd>NeoTreeFloat git_status<cr>", "status" },
		f = { "<cmd>Telescope git_files<cr>", "files" },
		w = {
			name = "Worktrees",
			w = { "<cmd>lua require('telescope').extensions.git_worktree.git_worktrees()<cr>", "worktrees" },
			c = { "<cmd>lua require('telescope').extensions.git_worktree.create_git_worktree()<cr>", "create" },
		},
	},
	s = {
		name = "Search",
		f = { "<cmd>Telescope current_buffer_fuzzy_find<cr>", "current file" },
		c = { "<cmd>Telescope grep_string<cr>", "word under cursor" },
		w = { "<cmd>Telescope live_grep<cr>", "current working dir" },
	},
	S = {
		name = "Sessions",
		c = { "<cmd>lua require('persistence').load()<cr>", "load" },
		l = { "<cmd>lua require('persistence').load({last = true})<cr>", "load last" },
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
	m = {
		name = "Marks",
		a = { "<cmd>lua require('harpoon.mark').add_file()<cr>", "add file" },
		n = { "<cmd>lua require('harpoon.ui').nav_next()<cr>", "next" },
		p = { "<cmd>lua require('harpoon.ui').nav_prev()<cr>", "previous" },
		l = { "<cmd>Telescope harpoon marks theme=dropdown<cr>", "list" }, -- theme needs to be set here, can't do it in config
	},
	q = {
		name = "Quickfix",
		t = { "<cmd>cw<cr>", "toggle" },
		n = { "<cmd>cn<cr>", "next" },
		p = { "<cmd>cp<cr>", "previous" },
		c = { "<cmd>cexpr []<cr>", "clear" },
		l = { "<cmd>Telescope quickfix<cr>", "list" },
	},
	d = {
		name = "Debug",
		c = { "<cmd>lua require('dap').continue()<cr>", "continue" },
		t = { "<cmd>lua require('dap').toggle_breakpoint()<cr>", "toggle breakpoint" },
		o = { "<cmd>lua require('dap').step_over()<cr>", "step over" },
		i = { "<cmd>lua require('dap').step_into()<cr>", "step into" },
	},
}, {
	prefix = "<leader>",
})
