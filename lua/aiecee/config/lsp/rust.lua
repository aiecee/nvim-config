local lsp_config = require("lspconfig")
local rust_tools = require("rust-tools")
local capabilities = require("aiecee.config.lsp.capabilities")

local M = {}

function M.setup()
	local c = capabilities.create_capabilities()
	lsp_config.rust_analyzer.setup({ capabilities = c })
	rust_tools.setup({})
end

return M
