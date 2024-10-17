return function()
	local completion = require("mini.completion")

	completion.setup({
		delay = {
			completion = 50,
			info = 50,
			signature = 50,
		},
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
		},
	})

	-- Setup tab navigation in completion
	vim.keymap.set("i", "<Tab>", function()
		return vim.fn.pumvisible() ~= 0 and "<C-n>" or "<Tab>"
	end, { expr = true })

	vim.keymap.set("i", "<S-Tab>", function()
		return vim.fn.pumvisible() ~= 0 and "<C-p>" or "<S-Tab>"
	end, { expr = true })

	-- Force open completion
	local force_completion = function()
		local force_completion_keys = vim.api.nvim_replace_termcodes("<C-x><C-o>", true, false, true)
		vim.api.nvim_feedkeys(force_completion_keys, "n", false)
	end
	vim.keymap.set("i", "<C-c>", force_completion)
	vim.keymap.set("i", "<C-Space>", force_completion)

	-- Fix <CR> to select completion item
	local keycode = vim.keycode or function(x)
		return vim.api.nvim_replace_termcodes(x, true, true, true)
	end

	local cr_action = function()
		local pairs = require("mini.pairs")
		local keys = {
			["cr"] = keycode(pairs.cr()),
			["ctrl-y"] = keycode("<C-y>"),
			["ctrl-y_cr"] = keycode("<C-y><CR>"),
		}

		if vim.fn.pumvisible() ~= 0 then
			local item_selected = vim.fn.complete_info()["selected"] ~= -1
			return item_selected and keys["ctrl-y"] or keys["ctrl-y_cr"]
		end

		return keys["cr"]
	end

	vim.keymap.set("i", "<CR>", cr_action, { expr = true })
end
