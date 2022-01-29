local lsp_installer_servers = require("nvim-lsp-installer.servers")
local servers = {
	"tsserver",
	"angularls",
	"html",
	"cssls",
	"sumneko_lua",
}

for _, server_name in pairs(servers) do
	local available, server = lsp_installer_servers.get_server(server_name)
	if available then
		server:on_ready(function()
			local capabilities = vim.lsp.protocol.make_client_capabilities()
			capabilities.textDocument.completion.completionItem.snippetSupport = true
			capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)

			local opts = {
				capabilities = capabilities,
			}
			if server.name == "sumneko_lua" then
				opts.settings = {
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
				}
			end
			server:setup(opts)
		end)
	end
	if not server:is_installed() then
		server:install()
	end
end

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
	update_in_insert = true,
})
