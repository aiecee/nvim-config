local M = {}

local keymap = require("aiecee.utils.keymaps")

local do_current_hunk = function(action)
	local line = vim.fn.line(".")
	MiniDiff.do_hunks(0, action, { line_start = line, line_end = line })
end

local do_visual_hunks = function(action)
	local line_start = vim.fn.line("'<")
	local line_end = vim.fn.line("'>")

	MiniDiff.do_hunks(0, action, {
		line_start = math.min(line_start, line_end),
		line_end = math.max(line_start, line_end),
	})
end

local global_mappings = {
	n = {
		-- commands
		{ "<Leader>-", require("snacks.picker").commands, "commands" },
		-- files
		{ "<Leader>t", require("snacks.explorer").open, "file tree" },
		{ "<Leader>ff", require("snacks.picker").smart, "find" },
		{ "<Leader>fr", require("snacks.picker").recent, "recent" },
		-- search
		{
			"<Leader>sw",
			function()
				require("snacks.picker").grep({
					hidden = true,
					ignored = true,
					exclude = { "**/node_modules/*", "**/dist/*" },
				})
			end,
			"current working dir",
		},
		{ "<Leader>sf", require("snacks.picker").grep_word, "word under cursor" },
		-- git
		{ "<Leader>gcc", require("snacks.picker").git_log, "commits" },
		{
			"<Leader>gcb",
			require("snacks.picker").git_log_file,
			"buffer commits",
		},
		{ "<Leader>gb", require("snacks.picker").git_branches, "branches" },
		{ "<Leader>gdd", "<cmd>DiffviewOpen<cr>", "diff" },
		{ "<Leader>gdf", "<cmd>DiffviewFileHistory %<cr>", "file history" },
		{ "<Leader>gdh", "<cmd>DiffviewFileHistory<cr>", "history" },
		{ "<Leader>gdc", "<cmd>DiffviewClose<cr>", "close diff" },
		{ "<Leader>gdr", "<cmd>DiffviewRefresh<cr>", "refresh diff" },
		{ "<Leader>gdt", "<cmd>DiffviewToggleFiles<cr>", "toggle diff files" },
		{ "<Leader>gho", function()
			MiniDiff.toggle_overlay(0)
		end, "toggle hunk overlay" },
		{ "<Leader>ghs", function()
			do_current_hunk("apply")
		end, "stage hunk" },
		{ "<Leader>ghr", function()
			do_current_hunk("reset")
		end, "reset hunk" },
		{ "<Leader>gl", require("snacks.git").blame_line, "line blame" },
		-- windows
		{ "<Leader>w=", "<cmd>wincmd =<cr>", "format" },
		{ "<Leader>wh", "<cmd>wincmd h<cr>", "go left" },
		{ "<Leader>wj", "<cmd>wincmd j<cr>", "go down" },
		{ "<Leader>wk", "<cmd>wincmd k<cr>", "go up" },
		{ "<Leader>wl", "<cmd>wincmd l<cr>", "go right" },
		{ "<Leader>ws", "<cmd>wincmd w<cr>", "split" },
		{ "<Leader>wv", "<cmd>wincmd v<cr>", "split vertically" },
		{ "<Leader>wx", "<cmd>wincmd x<cr>", "swap" },
		-- sessions
		{
			"<Leader>Ss",
			function()
				local sessions = require("ace.sessions")
				sessions:save()
			end,
			"save",
		},
		{
			"<Leader>SS",
			function()
				local sessions = require("ace.sessions")
				vim.ui.input({ prompt = "Session file: ", default = "session.vim" }, function(input)
					sessions:save(input)
				end)
			end,
			"save named",
		},
		{
			"<Leader>Sl",
			function()
				local sessions = require("ace.sessions")
				vim.ui.select(sessions:list(), {}, function(item, _)
					sessions:load(item)
				end)
			end,
			"load",
		},
		{
			"<Leader>SL",
			function()
				local sessions = require("ace.sessions")
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
	x = {
		{ "<Leader>ghS", function()
			do_visual_hunks("apply")
		end, "stage hunks" },
		{ "<Leader>ghR", function()
			do_visual_hunks("reset")
		end, "reset hunks" },
	},
}

function M.setup()
	keymap.map_table(global_mappings)
end

return M
