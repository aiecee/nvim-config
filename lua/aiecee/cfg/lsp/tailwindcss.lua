local on_attach = require("aiecee.cfg.lsp.on-attach")

return {
	mason_name = "tailwindcss",
	settings = {},
	on_attach = on_attach.on_attach_code,
}
