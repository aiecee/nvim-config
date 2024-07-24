local keymap = require("aiecee.utils.keymaps")
local files = require("mini.files")
local harpoon = require("harpoon")
local pickers = require("mini.pick")
local extra = require("mini.extra")

local global_mappings = {
	n = {
		-- commands
		{ "<Leader>-", extra.pickers.commands, "commands" },
		-- files
		{ "<Leader>t", files.open, "file tree" },
		{ "<Leader>ff", pickers.builtin.files, "find" },
		-- search
		{ "<Leader>sw", pickers.builtin.grep_live, "current working dir" },
		-- git
		{ "<Leader>gcc", extra.pickers.git_commits, "commits" },
		{
			"<Leader>gcb",
			function()
				extra.pickers.git_commits({ path = vim.fn.expand("%") })
			end,
			"buffer commits",
		},
		{ "<Leader>gb", extra.pickers.git_branches, "branches" },
		-- windows
		{ "<Leader>w=", "<cmd>wincmd =<cr>", "format" },
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
				harpoon:list():add()
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
		{
			"<Leader>ml",
			function()
				local harpoon_list = harpoon:list():display()
				local selected_item = pickers.start({
					source = {
						items = harpoon_list,
					},
					name = "Harpoon",
				})
				local _, idx = harpoon:list():get_by_value(selected_item)
				harpoon:list():select(idx)
			end,
			"list",
		},
		{
			"<Leader>mc",
			function()
				harpoon:list():clear()
			end,
			"clear",
		},
	},
}

keymap.map_table(global_mappings)
