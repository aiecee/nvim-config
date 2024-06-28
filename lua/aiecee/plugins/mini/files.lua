local mini_files = require("mini.files")
local files_config = {
	windows = {
		preview = true,
		width_preview = 75,
	},
	options = {
		use_as_default_explorer = true,
	},
}

mini_files.setup(files_config)

local map_split = function(buf_id, lhs, direction)
	local rhs = function()
		local new_target_window
		vim.api.nvim_win_call(mini_files.get_target_window(), function()
			vim.cmd(direction .. " split")
			new_target_window = vim.api.nvim_get_current_win()
		end)

		mini_files.set_target_window(new_target_window)
		mini_files.go_in({})
	end

	vim.keymap.set("n", lhs, rhs, { buffer = buf_id, desc = "Split " .. direction })
end

vim.api.nvim_create_autocmd("User", {
	pattern = "MiniFilesBufferCreate",
	callback = function(args)
		local buf_id = args.data.buf_id
		map_split(buf_id, "gv", "belowright horizontal")
		map_split(buf_id, "gs", "belowright vertical")
	end,
})

local show_gitignore = true

local filter_show = function(_)
	return true
end

local filter_hide = function(fs_entry)
	local ignore_path = vim.fn.system("git check-ignore " .. fs_entry.path)
	return string.len(ignore_path) == 0
end

local toggle_gitignore = function()
	show_gitignore = not show_gitignore
	local new_filter = show_gitignore and filter_show or filter_hide
	mini_files.refresh({ content = { filter = new_filter } })
end

vim.api.nvim_create_autocmd("User", {
	pattern = "MiniFilesBufferCreate",
	callback = function(args)
		local buf_id = args.data.buf_id
		vim.keymap.set("n", "g.", toggle_gitignore, { buffer = buf_id })
	end,
})
