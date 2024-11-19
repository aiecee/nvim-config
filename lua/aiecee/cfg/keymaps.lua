local keymap = require("aiecee.utils.keymaps")
local harpoon = require("harpoon")
local files = require("mini.files")
local sessions = require("ace.sessions")

local telescope_builtins = require("telescope.builtin")

local global_mappings = {
	n = {
		-- commands
		{ "<Leader>-", telescope_builtins.commands, "commands" },
		-- files
		{ "<Leader>t", files.open, "file tree" },
		{ "<Leader>ff", telescope_builtins.find_files, "find" },
		-- search
		{ "<Leader>sw", telescope_builtins.live_grep, "current working dir" },
		{ "<Leader>sf", telescope_builtins.grep_string, "word under cursor" },
		-- git
		{ "<Leader>gcc", telescope_builtins.git_commits, "commits" },
		-- {
		{
			"<Leader>gcb",
			telescope_builtins.git_bcommits,
			"buffer commits",
		},
		{ "<Leader>gb", telescope_builtins.git_branches, "branches" },
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
				local conf = require("telescope.config").values
				local file_paths = {}
				for _, item in ipairs(harpoon:list().items) do
					table.insert(file_paths, item.value)
				end

				require("telescope.pickers")
					.new({}, {
						prompt_title = "Harpoon",
						finder = require("telescope.finders").new_table({
							results = file_paths,
						}),
						previewer = conf.file_previewer({}),
						sorter = conf.generic_sorter({}),
					})
					:find()
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
			telescope_builtins.grep_string,
			"search selection",
		},
	},
}

keymap.map_table(global_mappings)
