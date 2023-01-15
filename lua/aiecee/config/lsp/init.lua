local mason = require("mason")
local mason_lspconfig = require("mason-lspconfig")
local lsp_config = require("lspconfig")
local cmp_lsp = require("cmp_nvim_lsp")

local cssls = require("aiecee.config.lsp.cssls")
local gopls = require("aiecee.config.lsp.gopls")
local html = require("aiecee.config.lsp.html")
local jsonls = require("aiecee.config.lsp.jsonls")
local null_ls = require("aiecee.config.lsp.null-ls")
local pyright = require("aiecee.config.lsp.pyright")
local rust_analyzer = require("aiecee.config.lsp.rust-analyzer")
local sumneko_lua = require("aiecee.config.lsp.sumneko-lua")
local tailwindcss = require("aiecee.config.lsp.tailwindcss")
local theme_check = require("aiecee.config.lsp.theme-check")
local tsserver = require("aiecee.config.lsp.tsserver")

local function add_server(table, server)
	table[server.name] = server.settings
end

local M = {}

function M.setup()
	local capabilities = vim.lsp.protocol.make_client_capabilities()
	capabilities = cmp_lsp.default_capabilities(capabilities)

	local servers = {}
	add_server(servers, cssls)
	add_server(servers, gopls)
	add_server(servers, html)
	add_server(servers, jsonls)
	add_server(servers, pyright)
	add_server(servers, rust_analyzer)
	add_server(servers, sumneko_lua)
	add_server(servers, tailwindcss)
	add_server(servers, theme_check)
	add_server(servers, tsserver)

	mason.setup({})

	null_ls.setup()

	mason_lspconfig.setup({
		ensure_installed = vim.tbl_keys(servers),
	})

	mason_lspconfig.setup_handlers({
		function(server_name)
			lsp_config[server_name].setup({
				capabilities = capabilities,
				settings = servers[server_name],
			})
		end,
	})

	vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
		update_in_insert = true,
	})

	vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
		border = "rounded",
	})
end

return M
