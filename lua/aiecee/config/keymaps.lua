-- local wk = require("which-key")

local map_table = require("aiecee.utils.keymaps")
local mini_files = require("mini.files")
local persistence = require("persistence")
local harpoon = require("harpoon")
local global_mappings = {
	n = {
		-- commands
		{ "<Leader>-", "<cmd>Telescope commands<cr>", "commands" },
		-- files
		{ "<Leader>t", mini_files.open, "file tree" },
		{ "<Leader>ff", "<cmd>Telescope find_files<cr>", "find" },
		{ "<Leader>fr", "<cmd>Telescope oldfiles<cr>", "recently opened" },
		-- search
		{ "<Leader>sf", "<cmd>Telescope current_buffer_fuzzy_find<cr>", "current file" },
		{ "<Leader>sc", "<cmd>Telescope grep_string<cr>", "word under cursor" },
		{ "<Leader>sw", "<cmd>Telescope live_grep<cr>", "current working dir" },
		-- git
		{ "<Leader>gcc", "<cmd>Telescope git_commits<cr>", "commits" },
		{ "<Leader>gcb", "<cmd>Telescope git_bcommits<cr>", "buffer commits" },
		{ "<Leader>gb", "<cmd>Telescope git_branches<cr>", "branches" },
		-- sessions
		{ "<Leader>Sc", persistence.load, "load" },
		{
			"<Leader>Sl",
			function()
				persistence.load({ last = true })
			end,
			"load last",
		},
		-- windows
		{ "<Leader>=", "<cmd>wincmd =<cr>", "format" },
		{ "<Leader>wh", "<cmd>wincmd h<cr>", "go left" },
		{ "<Leader>wj", "<cmd>wincmd j<cr>", "go down" },
		{ "<Leader>wk", "<cmd>wincmd k<cr>", "go up" },
		{ "<Leader>wl", "<cmd>wincmd l<cr>", "go right" },
		{ "<Leader>ws", "<cmd>wincmd w<cr>", "split" },
		{ "<Leader>wv", "<cmd>wincmd v<cr>", "split vertically" },
		{ "<Leader>wx", "<cmd>wincmd x<cr>", "swap" },
		-- marks
		{
			"<Leader>ma",
			function()
				harpoon:list():append()
			end,
			"add",
		},
		{
			"<Leader>mn",
			function()
				harpoon:list():next()
			end,
			"next",
		},
		{
			"<Leader>mp",
			function()
				harpoon:list():prev()
			end,
			"previous",
		},
		{ "<Leader>ml", "<cmd>Telescope harpoon marks theme=dropdown<cr>", "list" },
	},
}

map_table(global_mappings)
