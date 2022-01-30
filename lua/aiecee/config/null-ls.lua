local null_ls = require("null-ls")

null_ls.setup({
	sources = {
		-- Prettier
		null_ls.builtins.formatting.prettier,
		-- ESLint
		null_ls.builtins.formatting.eslint,
		null_ls.builtins.diagnostics.eslint,
		null_ls.builtins.code_actions.eslint,
		-- Stylua
		null_ls.builtins.formatting.stylua,
	},
	on_attach = function(client)
		if client.resolved_capabilities.document_formatting then
			vim.cmd([[
				augroup lsp_formatting
					autocmd! * <buffer>
					autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync(nil, 2000)
				augroup END
			]])
		end
	end,
})
