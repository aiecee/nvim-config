local sumneko_runtime_paths = vim.split(package.path, ";", {})
table.insert(sumneko_runtime_paths, "lua/?.lua")
table.insert(sumneko_runtime_paths, "lua/?/init.lua")

return {
	lsp_name = "sumneko_lua",
	mason_name = "sumneko_lua",
	settings = {
		Lua = {
			runtime = {
				version = "LuaJIT",
				path = sumneko_runtime_paths,
			},
			diagnostics = {
				globals = { "vim" },
			},
			workspace = {
				checkThirdPaty = false,
				library = vim.api.nvim_get_runtime_file("", true),
			},
			telemetry = {
				enable = false,
			},
		},
	},
}
