local M = {}

local leader_maps = {
	{ "n", "<leader>b", false },
	{ "n", "<leader>e", false },
	{ "n", "<leader>ca", false },
	{ "n", "<leader>cb", false },
	{ "n", "<leader>co", false },
	{ "n", "<leader>ct", false },
	{ "n", "<leader>cA", false },
	{ "n", "<leader>cB", false },
	{ "n", "<leader>cO", false },
	{ "n", "<leader>cT", false },
}

local ensure_clue_triggers = function(bufnr)
	local ok, clue = pcall(require, "mini.clue")
	if not ok then
		return
	end

	bufnr = bufnr or vim.api.nvim_get_current_buf()
	if vim.api.nvim_buf_is_valid(bufnr) then
		clue.ensure_buf_triggers(bufnr)
	end
end

local ensure_tabpage_clue_triggers = function()
	vim.schedule(function()
		for _, win in ipairs(vim.api.nvim_tabpage_list_wins(0)) do
			ensure_clue_triggers(vim.api.nvim_win_get_buf(win))
		end
	end)
end

function M.setup(opts)
	opts = vim.tbl_deep_extend("force", {
		hooks = {
			view_opened = ensure_tabpage_clue_triggers,
			view_enter = ensure_tabpage_clue_triggers,
			diff_buf_read = ensure_clue_triggers,
			diff_buf_win_enter = function(bufnr)
				ensure_clue_triggers(bufnr)
				ensure_tabpage_clue_triggers()
			end,
		},
		keymaps = {
			view = leader_maps,
			file_panel = leader_maps,
			file_history_panel = {
				{ "n", "<leader>b", false },
				{ "n", "<leader>e", false },
			},
		},
	}, opts or {})

	require("diffview").setup(opts or {})

	local group = vim.api.nvim_create_augroup("aiecee_diffview_clues", { clear = true })

	vim.api.nvim_create_autocmd("FileType", {
		group = group,
		pattern = { "DiffviewFiles", "DiffviewFileHistory" },
		callback = function(args)
			ensure_clue_triggers(args.buf)
		end,
	})

	vim.api.nvim_create_autocmd("User", {
		group = group,
		pattern = {
			"DiffviewViewOpened",
			"DiffviewViewEnter",
			"DiffviewDiffBufRead",
			"DiffviewDiffBufWinEnter",
		},
		callback = ensure_tabpage_clue_triggers,
	})
end

return M
