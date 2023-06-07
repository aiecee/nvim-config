return {
	{
		"jay-babu/mason-nvim-dap.nvim",
		dependencies = { "williamboman/mason.nvim" },
		opts = {
			ensure_installed = { "codelldb", "python" },
			automatic_setup = true,
		},
		config = true,
	},
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			"mxsdev/nvim-dap-vscode-js",
			{
				"microsoft/vscode-js-debug",
				version = "1.x",
				build = "npm i && npm run compile vsDebugServerBundle && mv dist out",
			},
		},
		config = function()
			local dap = require("dap")
			local dap_vscode = require("dap-vscode-js")
			dap_vscode.setup({
				debugger_path = vim.fn.stdpath("data") .. "/lazy/vscode-js-debug",
				adapters = { "pwa-node", "pwa-chrome" },
			})

			local node_config = {
				{
					type = "pwa-node",
					request = "attach",
					processId = require("dap.utils").pick_process,
					name = "Attach debugger to existing `node --inspect` process",
					sourceMaps = true,
					resolveSourceMapLocations = {
						"${workspaceFolder}/**",
						"!**/node_modules/**",
					},
					cwd = "${workspaceFolder}/src",
					skipFiles = { "${workspaceFolder}/node_modules/**/*.js" },
				},
				{
					type = "pwa-node",
					request = "launch",
					name = "Launch file in new node process",
					program = "${file}",
					cwd = "${workspaceFolder}",
				},
			}
			local chrome_config = {
				{
					type = "pwa-chrome",
					name = "Launch Chrome to debug client (3000)",
					request = "launch",
					url = "http://localhost:3000",
					sourceMaps = true,
					protocol = "inspector",
					port = 9222,
					webRoot = "${workspaceFolder}/src",
					skipFiles = { "**/node_modules/**/*", "**/@vite/*", "**/src/client/*", "**/src/*" },
				},
				{
					type = "pwa-chrome",
					name = "Launch Chrome to debug client (4200)",
					request = "launch",
					url = "http://localhost:4200",
					sourceMaps = true,
					protocol = "inspector",
					port = 9222,
					webRoot = "${workspaceFolder}/src",
					skipFiles = { "**/node_modules/**/*", "**/@vite/*", "**/src/client/*", "**/src/*" },
				},
			}

			local merged_config = {}
			vim.list_extend(merged_config, node_config)
			vim.list_extend(merged_config, chrome_config)

			dap.configurations["javascriptreact"] = chrome_config
			dap.configurations["typescriptreact"] = chrome_config
			dap.configurations["javascript"] = merged_config
			dap.configurations["typescript"] = merged_config
		end,
	},
	{
		"rcarriga/nvim-dap-ui",
		dependencies = { "mfussenegger/nvim-dap" },
		opts = {},
		config = function()
			local dap_ui = require("dapui")
			dap_ui.setup()

			local dap = require("dap")

			dap.listeners.after.event_initialized["dapui_config"] = function()
				dap_ui.open({})
			end
			dap.listeners.before.event_terminated["dapui_config"] = function()
				dap_ui.close({})
			end
			dap.listeners.before.event_exited["dapui_config"] = function()
				dap_ui.close({})
			end
			local sign = vim.fn.sign_define

			sign("DapBreakpoint", { text = "●", texthl = "DapBreakpoint", linehl = "", numhl = "" })
			sign("DapBreakpointCondition", { text = "●", texthl = "DapBreakpointCondition", linehl = "", numhl = "" })
			sign("DapLogPoint", { text = "◆", texthl = "DapLogPoint", linehl = "", numhl = "" })
		end,
	},
	{
		"theHamsta/nvim-dap-virtual-text",
		dependencies = { "mfussenegger/nvim-dap" },
		opts = { only_first_definition = false },
		config = true,
	},
}
