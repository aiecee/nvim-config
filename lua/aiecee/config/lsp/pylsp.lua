local on_attach = require("aiecee.config.lsp.on-attach")

return {
	lsp_name = "python-lsp-server",
	mason_name = "pylsp",
	settings = {},
	on_attach = on_attach.on_attach,
}
