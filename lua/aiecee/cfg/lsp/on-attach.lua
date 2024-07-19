local map_table = require("aiecee.utils.keymaps")

local M = {}

local function setup_code_keymap(bufnr)
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
	map_table(mapping)
end

function M.on_attach_code(_, bufnr)
	setup_code_keymap(bufnr)
end

function M.on_attach(_, bufnr)
	setup_code_keymap(bufnr)
end

return M
