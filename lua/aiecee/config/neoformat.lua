vim.cmd([[
	augroup lsp_formatting
		autocmd! * <buffer>
		autocmd BufWritePre * undojoin | Neoformat
	augroup END
]])
