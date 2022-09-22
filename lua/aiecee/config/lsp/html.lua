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
	lsp_config.html.setup({ capabilities = c, on_attach = on_attach })
end

return M
