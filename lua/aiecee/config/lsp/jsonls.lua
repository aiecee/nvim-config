local on_attach = require("aiecee.config.lsp.on-attach")

return {
	lsp_name = "jsonls",
	mason_name = "jsonls",
	settings = {},
	on_attach = on_attach.on_attach_code,
}
