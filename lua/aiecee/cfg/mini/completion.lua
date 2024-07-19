return function()
	local completion = require("mini.completion")
	local old_process_items = completion.config.lsp_completion.process_items

	completion.setup({
		window = {
			info = {
				border = "rounded",
			},
			signature = {
				border = "rounded",
			},
		},
		lsp_completion = {
			source_func = "omnifunc",
			process_items = function(items, base)
				local res = old_process_items(items, base)
				print(vim.inspect(res))
				return res
			end,
		},
	})

	local imap_expr = function(lhs, rhs)
		vim.keymap.set("i", lhs, rhs, { expr = true })
	end
	imap_expr("<Tab>", [[pumvisible() ? "\<C-n>" : "\<Tab>"]])
	imap_expr("<S-Tab>", [[pumvisible() ? "\<C-p>" : "\<S-Tab>"]])

	local keycode = vim.keycode or function(x)
		return vim.api.nvim_replace_termcodes(x, true, true, true)
	end
	local keys = {
		["cr"] = keycode("<CR>"),
		["ctrl-y"] = keycode("<C-y>"),
		["ctrl-y_cr"] = keycode("<C-y><CR>"),
	}

	_G.cr_action = function()
		if vim.fn.pumvisible() ~= 0 then
			-- If popup is visible, confirm selected item or add new line otherwise
			local item_selected = vim.fn.complete_info()["selected"] ~= -1
			return item_selected and keys["ctrl-y"] or keys["ctrl-y_cr"]
		else
			-- If popup is not visible, use plain `<CR>`. You might want to customize
			-- according to other plugins. For example, to use 'mini.pairs', replace
			-- next line with `return require('mini.pairs').cr()`
			return keys["cr"]
		end
	end

	vim.keymap.set("i", "<CR>", "v:lua._G.cr_action()", { expr = true })
end
