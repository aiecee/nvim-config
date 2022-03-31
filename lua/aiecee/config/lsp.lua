local lspsaga = require("lspsaga")
-- local rust_tools = require("rust-tools")
local null_ls = require("null-ls")
local lsp_config = require("lspconfig")

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)

-- lsp's: angularls, cssls, pyright, tsserver, html, sumneko_lua, tailwindcss

-- lsp-config
lsp_config.angularls.setup({ capabilities = capabilities })
lsp_config.cssls.setup({ capabilities = capabilities })
lsp_config.pyright.setup({ capabilities = capabilities })
lsp_config.tailwindcss.setup({ capabilities = capabilities })

local no_formatting_capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)
no_formatting_capabilities.textDocument.formatting = false
no_formatting_capabilities.textDocument.range_formatting = false
lsp_config.tsserver.setup({
	on_attach = function(client, bufnr)
		client.resolved_capabilities.document_formatting = false
		client.resolved_capabilities.document_range_formatting = false
	end,
	capabilities = no_formatting_capabilities,
})
lsp_config.html.setup({
	on_attach = function(client, bufnr)
		client.resolved_capabilities.document_formatting = false
		client.resolved_capabilities.document_range_formatting = false
	end,
	capabilities = no_formatting_capabilities,
})

local sumneko_runtime_paths = vim.split(package.path, ";")
table.insert(sumneko_runtime_paths, "lua/?.lua")
table.insert(sumneko_runtime_paths, "lua/?/init.lua")
lsp_config.sumneko_lua.setup({
	settings = {
		Lua = {
			runtime = {
				version = "LuaJIT",
				path = sumneko_runtime_paths,
			},
			diagnostics = {
				globals = { "vim" },
			},
			workspace = {
				library = vim.api.nvim_get_runtime_file("", true),
			},
			telemetry = {
				enable = false,
			},
		},
	},
})

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
	update_in_insert = true,
})

-- Lspsaga
lspsaga.setup()

-- Null-ls
null_ls.setup({
	sources = {
		-- Prettier
		null_ls.builtins.formatting.prettier,
		-- Stylua
		null_ls.builtins.formatting.stylua,
	},
	on_attach = function(client)
		if client.resolved_capabilities.document_formatting then
			vim.cmd([[
			augroup lsp_formatting
				autocmd! * <buffer>
				autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync(nil, 5000)
			augroup END
		]])
		end
	end,
	root_dir = lsp_config.util.root_pattern("package.json", ".null-ls-root", "Makefile", ".git"),
})
