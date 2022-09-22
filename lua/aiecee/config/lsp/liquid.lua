local lsp_config = require("lspconfig")
local capabilities = require("aiecee.config.lsp.capabilities")

local M = {}

function M.setup()
	local c = capabilities.create_capabilities()
	lsp_config.theme_check.setup({ capabilities = c })
end

return M
