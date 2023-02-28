local on_attach = require("aiecee.config.lsp.on-attach")

local rust_tools = require("rust-tools")
rust_tools.setup({})

return {
	lsp_name = "rust_analyzer",
	mason_name = "rust_analyzer",
	settings = {},
	on_attach = on_attach.on_attach,
}
