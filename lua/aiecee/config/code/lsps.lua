vim.keymap.del("n", "gra")
vim.keymap.del("n", "gri")
vim.keymap.del("n", "grn")
vim.keymap.del("n", "grr")
vim.keymap.del("n", "grt")

vim.api.nvim_create_autocmd("FileType", {
	pattern = "qf",
	callback = function()
		local remove_qf_item = function()
			local current_line = vim.fn.line(".")
			local qf = vim.fn.getqflist()
			table.remove(qf, current_line)
			vim.fn.setqflist(qf, "r")
			-- this refreshes the qf list window
			vim.cmd("copen")

			-- restore cursor
			local new_length = #qf
			if new_length == 0 then
				return
			end

			local new_line_idx = math.min(current_line, new_length)
			vim.api.nvim_win_set_cursor(0, { new_line_idx, 0 })
		end

		vim.keymap.set("n", "dd", remove_qf_item, { buffer = true })
	end,
})

vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(args)
		local snacks_picker = require("snacks.picker")

		vim.keymap.set("n", "gl", function()
			require("snacks.words").jump(1, true)
		end, { buffer = args.buf, desc = "next word" })
		vim.keymap.set("n", "ga", vim.lsp.buf.code_action, { buffer = args.buf, desc = "[LSP] code actions" })
		vim.keymap.set("n", "gr", snacks_picker.lsp_references, { buffer = args.buf, desc = "[LSP] references" })
		vim.keymap.set("n", "gb", snacks_picker.lsp_definitions, { buffer = args.buf, desc = "[LSP] definitions" })
		vim.keymap.set("n", "gR", vim.lsp.buf.rename, { buffer = args.buf, desc = "[LSP] rename" })
		vim.keymap.set("n", "gh", vim.lsp.buf.hover, { buffer = args.buf, desc = "[LSP] hover" })
		vim.keymap.set("n", "<Leader>cl", function()
			require("snacks.words").jump(1, true)
		end, { buffer = args.buf, desc = "next word" })
		vim.keymap.set("n", "<Leader>ca", vim.lsp.buf.code_action, { buffer = args.buf, desc = "code actions" })
		vim.keymap.set("n", "<Leader>cr", snacks_picker.lsp_references, { buffer = args.buf, desc = "references" })
		vim.keymap.set("n", "<Leader>cb", snacks_picker.lsp_definitions, { buffer = args.buf, desc = "definitions" })
		vim.keymap.set("n", "<Leader>cR", vim.lsp.buf.rename, { buffer = args.buf, desc = "rename" })
		vim.keymap.set("n", "<Leader>ch", vim.lsp.buf.hover, { buffer = args.buf, desc = "hover" })

		vim.keymap.set(
			"n",
			"<Leader>cd",
			snacks_picker.diagnostics_buffer,
			{ buffer = args.buffer, desc = "buffer diagnostics" }
		)
		vim.keymap.set(
			"n",
			"gd",
			snacks_picker.diagnostics_buffer,
			{ buffer = args.buf, desc = "[LSP] buffer diagnostics" }
		)
		vim.keymap.set(
			"n",
			"<Leader>cD",
			snacks_picker.diagnostics,
			{ buffer = args.buffer, desc = "project diagnostics" }
		)
		vim.keymap.set("n", "gD", snacks_picker.diagnostics, { buffer = args.buf, desc = "[LSP] project diagnostics" })

		local client =
			assert(vim.lsp.get_client_by_id(args.data.client_id), "Can not find client for id: " .. args.data.client_id)
		if client:supports_method("textDocument/completion") then
			-- vim.lsp.completion.enable(true, client.id, args.buf, { autotrigger = true })

			vim.keymap.set("i", "<Tab>", function()
				return vim.fn.pumvisible() == 1 and "<C-n>" or "<Tab>"
			end, { expr = true, buffer = args.buf })

			vim.keymap.set("i", "<S-Tab>", function()
				return vim.fn.pumvisible() == 1 and "<C-p>" or "<S-Tab>"
			end, { expr = true, buffer = args.buf })

			vim.keymap.set("i", "<CR>", function()
				return vim.fn.pumvisible() == 1 and "<C-y>" or "<CR>"
			end, { expr = true, buffer = args.buf })

			vim.keymap.set("i", "<Esc>", function()
				return vim.fn.pumvisible() == 1 and "<C-e>" or "<Esc>"
			end, { expr = true, buffer = args.buf })

			vim.keymap.set("i", "<C-Space>", function()
				vim.lsp.completion.get()
			end, { expr = true, buffer = args.buf })
		end
	end,
})

vim.lsp.enable({
	"lua_ls",
	-- "vtsls",
  "tsgo",
	"cssls",
	"html",
	"jsonls",
	"tailwindcss",
	"eslint",
	"ansiblels",
	"gopls",
	"golangci_lint_ls",
	"ruff",
	"ty",
	"biome",
})
