local on_attach = require("aiecee.config.lsp.on-attach")

return {
	lsp_name = "html",
	mason_name = "html",
	settings = {},
	on_attach = on_attach.on_attach_code,
}
