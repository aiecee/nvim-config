return {
	{
		"jay-babu/mason-nvim-dap.nvim",
		dependencies = { "williamboman/mason.nvim" },
		opts = {
			ensure_installed = { "codelldb", "python", "node2", "chrome" },
			automatic_setup = true,
		},
		config = function(_, opts)
			local mason_dap = require("mason-nvim-dap")
			mason_dap.setup(opts)
			mason_dap.setup_handlers()
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
		end,
	},
}
