vim.cmd([[
	augroup neoformat_on_write
		autocmd!
		autocmd BufWritePre *.js,*.jsx,*.ts,*.tsx,*.css,*.scss,*.html,*.json,*.toml,*.md, undojoin | Neoformat prettier
		autocmd BufWritePre *.lua, undojoin | Neoformat stylua
	augroup end
]])
