local M = {}

local sumneko_runtime_paths = vim.split(package.path, ";", {})
table.insert(sumneko_runtime_paths, "lua/?.lua")
table.insert(sumneko_runtime_paths, "lua/?/init.lua")

M.name = "sumneko_lua"
M.settings = {
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
}

return M
