local keymap = require("aiecee.utils.keymaps")

local function on_attach(client, bufnr)
	local telescope_builtins = require("telescope.builtin")

	local mapping = {
		n = {
			{ "ga", vim.lsp.buf.code_action, "[LSP] code actions", { buffer = bufnr } },
			{
				"gr",
				telescope_builtins.lsp_references,
				"[LSP] references",
				{ buffer = bufnr },
			},
			{
				"gb",
				telescope_builtins.lsp_definitions,
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
				telescope_builtins.lsp_definitions,
				"go to definition",
				{ buffer = bufnr },
			},
			{
				"<Leader>ci",
				telescope_builtins.lsp_implementations,
				"go to implementations",
				{ buffer = bufnr },
			},
			{
				"<Leader>cr",
				telescope_builtins.lsp_references,
				"all references",
				{ buffer = bufnr },
			},
			{
				"<Leader>cd",
				function()
					vim.diagnostic.open_float({ border = "rounded" })
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
	-- 	settings = {
	-- 		javascript = {
	-- 			inlayHints = {
	-- 				includeInlayEnumMemberValueHints = true,
	-- 				includeInlayFunctionLikeReturnTypeHints = true,
	-- 				includeInlayFunctionParameterTypeHints = true,
	-- 				includeInlayParameterNameHints = "all", -- 'none' | 'literals' | 'all';
	-- 				includeInlayParameterNameHintsWhenArgumentMatchesName = true,
	-- 				includeInlayPropertyDeclarationTypeHints = true,
	-- 				includeInlayVariableTypeHints = false,
	-- 			},
	-- 		},
	--
	-- 		typescript = {
	-- 			inlayHints = {
	-- 				includeInlayEnumMemberValueHints = true,
	-- 				includeInlayFunctionLikeReturnTypeHints = true,
	-- 				includeInlayFunctionParameterTypeHints = true,
	-- 				includeInlayParameterNameHints = "all", -- 'none' | 'literals' | 'all';
	-- 				includeInlayParameterNameHintsWhenArgumentMatchesName = true,
	-- 				includeInlayPropertyDeclarationTypeHints = true,
	-- 				includeInlayVariableTypeHints = false,
	-- 			},
	-- 		},
	-- 	},
	-- 	on_attach = on_attach,
	-- },
	vtsls = {
		settings = {
			typescript = {
				inlayHints = {
					parameterNames = {
						enabled = "none",
					},
					parameterTypes = {
						enabled = false,
					},
					variableTypes = {
						enabled = false,
					},
					propertyDeclarationTypes = {
						enabled = false,
					},
					functionLikeReturnTypes = {
						enabled = false,
					},
				},
			},
			javascript = {
				inlayHints = {
					parameterNames = {
						enabled = "all",
					},
					parameterTypes = {
						enabled = true,
					},
					variableTypes = {
						enabled = false,
					},
					propertyDeclarationTypes = {
						enabled = false,
					},
					functionLikeReturnTypes = {
						enabled = false,
					},
				},
			},
		},
		on_attach = on_attach,
	},
	zls = {
		settings = {},
		on_attach = on_attach,
	},
}
