return {
	{
		"folke/trouble.nvim",
		-- TODO - move these elsewhere
		keys = {
			{ "gq", "<cmd>Trouble quickfix toggle<cr>", desc = "quickfix" },
			{ "gw", "<cmd>Trouble diagnostics toggle<cr>", desc = "workspace diagnostics" },
			{ "gt", "<cmd>Trouble toggle<cr>", desc = "trouble" },
		},
		config = true,
	},
	{
		"lewis6991/gitsigns.nvim",
		opts = {
			current_line_blame = true,
		},
		config = true,
	},
	{
		"ThePrimeagen/refactoring.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
		},
		config = function()
			vim.keymap.set({ "n", "x" }, "<leader>re", function()
				return require("refactoring").refactor("Extract Function")
			end, { expr = true, desc = "extract function" })

			vim.keymap.set({ "n", "x" }, "<leader>rf", function()
				return require("refactoring").refactor("Extract Function To File")
			end, { expr = true, desc = "extract function to file" })

			vim.keymap.set({ "n", "x" }, "<leader>rv", function()
				return require("refactoring").refactor("Extract Variable")
			end, { expr = true, desc = "extract variable" })

			vim.keymap.set({ "n", "x" }, "<leader>rI", function()
				return require("refactoring").refactor("Inline Function")
			end, { expr = true, desc = "inline function" })

			vim.keymap.set({ "n", "x" }, "<leader>ri", function()
				return require("refactoring").refactor("Inline Variable")
			end, { expr = true, desc = "inline variable" })

			vim.keymap.set({ "n", "x" }, "<leader>rb", function()
				return require("refactoring").refactor("Extract Block")
			end, { expr = true, desc = "extract block" })

			vim.keymap.set({ "n", "x" }, "<leader>rB", function()
				return require("refactoring").refactor("Extract Block To File")
			end, { expr = true, desc = "extract block to file" })
		end,
	},
	{
		"stevearc/conform.nvim",
		keys = {
			{
				"<Leader>cf",
				function()
					require("conform").format({ bufnr = vim.api.nvim_get_current_buf() })
				end,
				mode = "n",
				desc = "format",
			},
		},
		opts = {
			formatters_by_ft = {
				lua = { "stylua" },
				typescript = { "prettier" },
				typescriptreact = { "prettier" },
				javascript = { "prettier" },
				javascriptreact = { "prettier" },
				json = { "prettier" },
				-- typescript = { "biome" },
				-- typescriptreact = { "biome" },
				-- javascript = { "biome" },
				-- javascriptreact = { "biome" },
				-- json = { "biome" },
				astro = { "prettier" },
				yaml = { "prettier" },
				toml = { "prettier" },
				zig = { "zigfmt" },
				go = { "gofmt", "goimports", "golangci-lint" },
			},
			format_on_save = {
				lsp_format = "fallback",
				timeout_ms = 1000,
			},
		},
		config = true,
	},
}
