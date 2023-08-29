return {
	{
		"jay-babu/mason-nvim-dap.nvim",
		dependencies = { "williamboman/mason.nvim" },
		opts = {
			ensure_installed = { "codelldb", "python", "kotlin" },
			automatic_setup = true,
			handlers = {},
		},
		config = true,
	},
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			"Mgenuit/nvim-dap-kotlin",
		},
		config = function()
			local kotlin_dap = require("dap-kotlin")
			kotlin_dap.setup({})
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
