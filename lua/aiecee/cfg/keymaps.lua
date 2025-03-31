local keymap = require("aiecee.utils.keymaps")
local sessions = require("ace.sessions")

local global_mappings = {
	n = {
		-- commands
		{ "<Leader>-", require("snacks.picker").commands, "commands" },
		-- files
		{ "<Leader>t", require("snacks.explorer").open, "file tree" },
		{ "<Leader>ff", require("snacks.picker").smart, "find" },
		{ "<Leader>fr", require("snacks.picker").recent, "recent" },
		-- search
		{ "<Leader>sw", require("snacks.picker").grep, "current working dir" },
		{ "<Leader>sf", require("snacks.picker").grep_word, "word under cursor" },
		-- git
		{ "<Leader>gcc", require("snacks.picker").git_log, "commits" },
		{
			"<Leader>gcb",
			require("snacks.picker").git_log_file,
			"buffer commits",
		},
		{ "<Leader>gb", require("snacks.picker").git_branches, "branches" },
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
				require("harpoon"):list():add()
			end,
			"add",
		},
		{
			"<Leader>mn",
			function()
				require("harpoon"):list():next()
			end,
			"next",
		},
		{
			"<Leader>mp",
			function()
				require("harpoon"):list():prev()
			end,
			"previous",
		},
		{
			"<Leader>ml",
			function()
				local harpoon = require("harpoon")
				local file_paths = {}
				for _, item in ipairs(harpoon:list().items) do
					table.insert(file_paths, item.value)
				end

				vim.ui.select(file_paths, {}, function(_, idx)
					harpoon:list():select(idx)
				end)
			end,
			"list",
		},
		{
			"<Leader>mc",
			function()
				require("harpoon"):list():clear()
			end,
			"clear",
		},
		-- sessions
		{
			"<Leader>Ss",
			function()
				sessions:save()
			end,
			"save",
		},
		{
			"<Leader>SS",
			function()
				vim.ui.input({ prompt = "Session file: ", default = "session.vim" }, function(input)
					sessions:save(input)
				end)
			end,
			"save named",
		},
		{
			"<Leader>Sl",
			function()
				vim.ui.select(sessions:list(), {}, function(item, _)
					sessions:load(item)
				end)
			end,
			"load",
		},
		{
			"<Leader>SL",
			function()
				sessions:load()
			end,
			"load default",
		},
	},
	v = {
		{
			"gf",
			require("snacks.picker").grep_word,
			"search selection",
		},
	},
}

keymap.map_table(global_mappings)
