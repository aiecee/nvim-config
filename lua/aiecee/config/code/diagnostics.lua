vim.diagnostic.config({
	underline = true,
	virtual_text = true,
	-- virtual_lines = {
	-- 	current_line = true,
	-- },
	update_in_insert = true,
	severity_sort = true,
})

local diag_augroup = vim.api.nvim_create_augroup("AieCeeDiagnostics", {})
vim.api.nvim_create_autocmd("CursorHold", {
	group = diag_augroup,
	callback = function()
		vim.diagnostic.open_float(nil, { focusable = false, source = "if_many" })
	end,
})
