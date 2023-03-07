local on_attach = require("aiecee.config.lsp.on-attach")

return {
	mason_name = "tsserver",
	settings = {},
	on_attach = on_attach.on_attach_code,
}
