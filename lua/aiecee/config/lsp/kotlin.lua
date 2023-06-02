local on_attach = require("aiecee.config.lsp.on-attach")

return {
	mason_name = "kotlin_language_server",
	settings = {},
	on_attach = on_attach.on_attach_code,
}
