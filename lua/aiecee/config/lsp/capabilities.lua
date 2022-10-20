local cmp_nvim_lsp = require("cmp_nvim_lsp")

local M = {}

function M.create_capabilities(preventFormatting)
	local formatting = preventFormatting or false
	local capabilities = vim.lsp.protocol.make_client_capabilities()
	capabilities.textDocument.completion.completionItem.snippetSupport = true
	capabilities = cmp_nvim_lsp.default_capabilities(capabilities)
	if formatting then
		capabilities.textDocument.formatting = false
		capabilities.textDocument.range_formatting = false
	end
	return capabilities
end

return M
