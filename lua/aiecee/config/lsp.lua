local lsp_installer_servers = require("nvim-lsp-installer.servers")
local lspsaga = require("lspsaga")
local rust_tools = require("rust-tools")
-- local null_ls = require("null-ls")

-- LSP
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)

local servers = {
	"tsserver",
	"angularls",
	"html",
	"cssls",
	"sumneko_lua",
	"pyright",
	"rust_analyzer",
}
local server_options = {
	["tsserver"] = { capabilities = capabilities },
	["angularls"] = { capabilities = capabilities },
	["html"] = { capabilities = capabilities },
	["cssls"] = { capabilities = capabilities },
	["sumneko_lua"] = {
		capabilities = capabilities,
		settings = {
			Lua = {
				runtime = {
					version = "LuaJIT",
					path = vim.split(package.path, ";"),
				},
				diagnostics = {
					globals = { "vim", "require" },
				},
				workspace = {
					library = {
						[vim.fn.expand("$VIMRUNTIME/lua")] = true,
						[vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
					},
				},
			},
		},
	},
	["pyright"] = { capabilities = capabilities },
	["rust_analyzer"] = { capabilities = capabilities },
}

local rust_tools_opts = {
	runnbales  ={
		use_telescope = true
	}
}

for _, server_name in pairs(servers) do
	local available, server = lsp_installer_servers.get_server(server_name)
	if available then
		server:on_ready(function()
			if server.name == "rust_analyzer" then
				rust_tools.setup({
					server = vim.tbl_deep_extend("force", server:get_default_options(), server_options[server.name]),
					tools = rust_tools_opts
				})
				server:attach_buffers()
			else
				server:setup(server_options[server.name])
			end
		end)
	end
	if not server:is_installed() then
		server:install()
	end
end

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
	update_in_insert = true,
})

-- Lspsaga
lspsaga.setup()

-- Null-ls
-- null_ls.setup({
-- 	sources = {
-- Prettier
-- 	null_ls.builtins.formatting.prettier,
-- ESLint
-- null_ls.builtins.formatting.eslint,
-- null_ls.builtins.diagnostics.eslint,
-- null_ls.builtins.code_actions.eslint,
-- Stylua
-- null_ls.builtins.formatting.stylua,
-- },
-- on_attach = function(client)
-- if client.resolved_capabilities.document_formatting then
-- vim.cmd([[
-- augroup lsp_formatting
-- autocmd! * <buffer>
-- autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync(nil, 2000)
-- augroup END
-- ]])
-- end
-- end,
-- })
