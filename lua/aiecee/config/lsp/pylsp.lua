local on_attach = require("aiecee.config.lsp.on-attach")

return {
	mason_name = "pylsp",
	settings = {},
	on_attach = on_attach.on_attach,
}
