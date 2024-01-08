-- local wk = require("which-key")
local map_table = require("aiecee.utils.keymaps")

local M = {}

local function setup_code_keymap(bufnr)
	local mapping = {
		n = {
			{ "ga", vim.lsp.buf.code_action, "[LSP] code actions", { buffer = bufnr } },
			{ "gr", "<cmd>Telescope lsp_references<cr>", "[LSP] references", { buffer = bufnr } },
			{ "gb", "<cmd>Telescope lsp_definitions<cr>", "[LSP] definitions", { buffer = bufnr } },
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
			{ "<Leader>cb", "<cmd>Telescope lsp_definitions<cr>", "go to definition", { buffer = bufnr } },
			{ "<Leader>ci", "<cmd>Telescope lsp_implementations<cr>", "go to implementations", { buffer = bufnr } },
			{ "<Leader>cr", "<cmd>Telescope lsp_references<cr>", "all references", { buffer = bufnr } },
			{ "<Leader>cd", "<cmd>Telescope diagnostics<cr>", "diagnostics", { buffer = bufnr } },
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
			{ "<Leader>ct", "<cmd>TodoTelescope<cr>", "todos", { buffer = bufnr } },
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
