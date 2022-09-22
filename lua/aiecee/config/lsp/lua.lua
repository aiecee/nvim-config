local lsp_config = require("lspconfig")
local capabilities = require("aiecee.config.lsp.capabilities")

local M = {}

function M.setup()
	local on_attach = function(client)
		client.server_capabilities.document_formatting = false
		client.server_capabilities.documentFormattingProvider = false
		client.server_capabilities.document_range_formatting = false
	end

	local c = capabilities.create_capabilities(true)
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
		capabilities = c,
		on_attach = on_attach,
	})
end

return M
