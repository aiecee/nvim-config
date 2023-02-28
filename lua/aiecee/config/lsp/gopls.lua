local on_attach = require("aiecee.config.lsp.on-attach")
return {
	lsp_name = "gopls",
	mason_name = "gopls",
	settings = {},
	on_attach = on_attach.on_attach,
}
