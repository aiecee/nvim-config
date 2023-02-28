local wk = require("which-key")

local M = {}

local function setup_code_keymap(bufnr)
	print("Hello")
	vim.keymap.set("n", "ga", vim.lsp.buf.code_action, { desc = "[LSP] code actions" })
	vim.keymap.set("n", "gr", "<cmd>Telescope lsp_references<cr>", { desc = "[LSP] references" })
	vim.keymap.set("n", "gb", "<cmd>Telescope lsp_definitions<cr>", { desc = "[LSP] definitions" })
	vim.keymap.set("n", "gR", vim.lsp.buf.rename, { desc = "[LSP] rename" })
	vim.keymap.set("n", "gh", vim.lsp.buf.hover, { desc = "[LSP] hover" })
	wk.register({
		c = {
			name = "Code",
			b = { "<cmd>Telescope lsp_definitions<cr>", "go to definition" },
			i = { "<cmd>Telescope lsp_implementations<cr>", "go to implementations" },
			r = { "<cmd>Telescope lsp_references<cr>", "all references" },
			d = { "<cmd>Telescope diagnostics<cr>", "diagnostics" },
			f = { "<cmd>lua vim.lsp.buf.format({ timeout_ms = 5000 })<cr>", "format" },
			a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "code actions" },
			R = { "<cmd>lua vim.lsp.buf.rename()<cr>", "rename" },
			h = { "<cmd>lua vim.lsp.buf.hover()<cr>", "hover" },
			t = { "<cmd>TodoTelescope<cr>", "todos" },
			u = { "<cmd>set ff=unix<cr>", "to unix" },
		},
	}, { prefix = "<leader>", buffer = bufnr })
end

local function setup_dap_keymap(bufnr)
	vim.keymap.set("n", "gt", function()
		require("dap").toggle_breakpoint()
	end, { desc = "[DAP] toggle breakpoint" })
	vim.keymap.set("n", "go", function()
		require("dap").step_over()
	end, { desc = "[DAP] step over" })
	vim.keymap.set("n", "gs", function()
		require("dap").continue()
	end, { desc = "[DAP] continue" })
	vim.keymap.set("n", "gt", function()
		require("dap").terminate()
	end, { desc = "[DAP] terminate" })
	wk.register({
		d = {
			name = "Debug",
			b = { "<cmd>lua require('dap').toggle_breakpoint()<cr>", "toggle breakpoint" },
			c = { "<cmd>lua require('dap').continue()<cr>", "continue" },
			o = { "<cmd>lua require('dap').step_over()<cr>", "step over" },
			i = { "<cmd>lua require('dap').step_into()<cr>", "step_into" },
			t = { "<cmd>lua require('dap').terminate()<cr>", "terminate" },
		},
	}, { prefix = "<leader>", buffer = bufnr })
end

function M.on_attach_code(_, bufnr)
	setup_code_keymap(bufnr)
end

function M.on_attach_dap(_, bufnr)
	setup_dap_keymap(bufnr)
end

function M.on_attach(_, bufnr)
	setup_code_keymap(bufnr)
	setup_dap_keymap(bufnr)
end

return M
