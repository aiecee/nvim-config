local on_attach = require("aiecee.config.lsp.on-attach")

return {
	lsp_name = "tsserver",
	mason_name = "tsserver",
	settings = {},
	on_attach = on_attach.on_attach_code,
}
