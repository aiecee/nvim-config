local keymap = require("aiecee.utils.keymaps")

local function on_attach(client, bufnr)
	local extras = require("mini.extra")

	local mapping = {
		n = {
			{ "ga", vim.lsp.buf.code_action, "[LSP] code actions", { buffer = bufnr } },
			{
				"gr",
				function()
					extras.pickers.lsp({ scope = "references" })
				end,
				"[LSP] references",
				{ buffer = bufnr },
			},
			{
				"gb",
				function()
					extras.pickers.lsp({ scope = "definition" })
				end,
				"[LSP] definitions",
				{ buffer = bufnr },
			},
			{ "gR", vim.lsp.buf.rename, "[LSP] rename", { buffer = bufnr } },
			{ "gh", vim.lsp.buf.hover, "[LSP] hover", { buffer = bufnr } },
			{
				"gd",
				function()
					vim.diagnostic.open_float({ border = "rounded" })
				end,
				"[LSP] diagnostics",
				{ buffer = bufnr },
			},
			{
				"<Leader>cb",
				function()
					extras.pickers.lsp({ scope = "definition" })
				end,
				"go to definition",
				{ buffer = bufnr },
			},
			{
				"<Leader>ci",
				function()
					extras.pickers.lsp({ scope = "implementation" })
				end,
				"go to implementations",
				{ buffer = bufnr },
			},
			{
				"<Leader>cr",
				function()
					extras.pickers.lsp({ scope = "references" })
				end,
				"all references",
				{ buffer = bufnr },
			},
			{
				"<Leader>cd",
				function()
					extras.pickers.diagnostic()
				end,
				"diagnostics",
				{ buffer = bufnr },
			},
			{
				"<Leader>cf",
				function()
					vim.lsp.buf.format({ timeout_ms = 5000 })
				end,
				"format",
				{ buffer = bufnr },
			},
			{ "<Leader>ca", vim.lsp.buf.code_action, "code actions", { buffer = bufnr } },
			{ "<Leader>cr", vim.lsp.buf.rename, "rename", { buffer = bufnr } },
			{ "<Leader>ch", vim.lsp.buf.hover, "hover", { buffer = bufnr } },
		},
		i = {
			{ "C-s", vim.lsp.buf.signature_help, "signature help", { buffer = bufnr } },
		},
	}
	keymap.map_table(mapping)

	if client.server_capabilities.inlayHintProvider then
		vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
	end
end

return {
	cssls = {
		settings = {},
		on_attach = on_attach,
	},
	eslint = {
		settings = {},
		on_attach = on_attach,
	},
	gopls = {
		settings = {},
		on_attach = on_attach,
	},
	html = {
		settings = {},
		on_attach = on_attach,
	},
	jsonls = {
		settings = {},
		on_attach = on_attach,
	},
	lua_ls = {
		settings = {},
		on_attach = on_attach,
	},
	marksman = {
		settings = {},
		on_attach = on_attach,
	},
	tailwindcss = {
		settings = {},
		on_attach = on_attach,
	},
	shopify_theme_ls = {
		settings = {},
		on_attach = on_attach,
	},
	volar = {
		settings = {},
		on_attach = on_attach,
	},
	-- ts_ls = {
	-- 	settings = {},
	-- 	on_attach = on_attach,
	-- },
	vtsls = {
		settings = {},
		on_attach = on_attach,
	},
}
