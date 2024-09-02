return function()
	local files = require("mini.files")

	files.setup({
		windows = {
			preview = true,
			width_preview = 75,
		},
		options = {
			use_as_default_explorer = true,
		},
	})

	local map_split = function(buf_id, lhs, direction, go_in)
		local rhs = function()
			local new_target_window
			---@diagnostic disable-next-line: param-type-mismatch
			vim.api.nvim_win_call(files.get_explorer_state().target_window, function()
				vim.cmd(direction .. " split")
				new_target_window = vim.api.nvim_get_current_win()
			end)

			files.set_target_window(new_target_window)
			files.go_in({
				close_on_file = go_in,
			})
		end

		vim.keymap.set("n", lhs, rhs, { buffer = buf_id, desc = "Split " .. direction })
	end

	vim.api.nvim_create_autocmd("User", {
		pattern = "MiniFilesBufferCreate",
		callback = function(args)
			local buf_id = args.data.buf_id
			map_split(buf_id, "s", "belowright horizontal", false)
			map_split(buf_id, "v", "belowright vertical", false)
			map_split(buf_id, "S", "belowright horizontal", true)
			map_split(buf_id, "V", "belowright vertical", true)
		end,
	})
end
