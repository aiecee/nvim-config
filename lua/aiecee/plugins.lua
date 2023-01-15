local api = vim.api
local fn = vim.fn

local function ensure_packer_installed()
	local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if fn.glob(install_path) ~= "" then
		return false
	end

	api.nvim_echo({ { "Installing Packer", "Type" } }, true, {})

	local packer_repo = "https://github.com/wbthomason/packer.nvim"
	local command = { "git", "clone", "--depth", "1", packer_repo, install_path }
	fn.system(command)
	vim.cmd.packadd("packer.nvim")
	return true
end

local is_installed = ensure_packer_installed()

-- Use a protected call so we don't error out on first Use
local packer_exists, packer = pcall(require, "packer")
if not packer_exists then
	return
end

local packer_util = require("packer.util")

--Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return packer_util.float({ border = "rounded" })
		end,
	},
})

-- Install plugins
packer.startup({
	function(use)
		-- Packer
		use("wbthomason/packer.nvim")

		-- Themes
		use({ "catppuccin/nvim", as = "catppuccin" })

		-- Notify
		use("rcarriga/nvim-notify")

		-- Telescope
		use({
			"nvim-telescope/telescope.nvim",
			requires = {
				"nvim-lua/plenary.nvim",
				"nvim-telescope/telescope-ui-select.nvim",
				"nvim-telescope/telescope-hop.nvim",
				"nvim-telescope/telescope-file-browser.nvim",
			},
		})

		-- LSP, config and plugins
		use({
			"neovim/nvim-lspconfig",
			requires = {
				"williamboman/mason.nvim",
				"williamboman/mason-lspconfig.nvim",
				"jose-elias-alvarez/null-ls.nvim",
				"jayp0521/mason-null-ls.nvim",
				"simrat39/rust-tools.nvim",
				"folke/neodev.nvim",
			},
		})

		-- Completion
		use({
			"hrsh7th/nvim-cmp",
			requires = {
				"hrsh7th/cmp-nvim-lsp",
				"hrsh7th/cmp-buffer",
				"hrsh7th/cmp-path",
				"hrsh7th/cmp-cmdline",
				"hrsh7th/cmp-nvim-lsp-signature-help",
				"lukas-reineke/cmp-rg",
				"hrsh7th/cmp-vsnip",
				"hrsh7th/vim-vsnip",
				"hrsh7th/vim-vsnip-integ",
				"rafamadriz/friendly-snippets",
				"onsails/lspkind-nvim",
				"lukas-reineke/cmp-under-comparator",
			},
		})

		-- Treesitter
		use({
			"nvim-treesitter/nvim-treesitter",
			run = function()
				pcall(require("nvim-treesitter.install").update({ with_sync = true }))
			end,
		})
		use({ "nvim-treesitter/nvim-treesitter-refactor", after = "nvim-treesitter" })
		use({ "nvim-treesitter/nvim-treesitter-context", after = "nvim-treesitter" })
		use("windwp/nvim-ts-autotag")

		-- NeoTree
		use({
			"nvim-neo-tree/neo-tree.nvim",
			branch = "v2.x",
			requires = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim", "kyazdani42/nvim-web-devicons" },
		})

		-- Git
		use("lewis6991/gitsigns.nvim")
		use({ "ThePrimeagen/git-worktree.nvim" })

		use({ "ThePrimeagen/harpoon", requires = { "nvim-lua/plenary.nvim" } })

		-- Code Helpers
		use("windwp/nvim-autopairs")
		use("numToStr/Comment.nvim")
		use("folke/todo-comments.nvim")
		use("lukas-reineke/indent-blankline.nvim")

		-- Feline
		use({
			"feline-nvim/feline.nvim",
			requires = { "kyazdani42/nvim-web-devicons" },
		})

		-- Which-key
		use("folke/which-key.nvim")

		-- Hop
		use("phaazon/hop.nvim")

		use({
			"folke/persistence.nvim",
			event = "BufReadPre",
			module = "persistence",
			config = function()
				require("persistence").setup({
					dir = vim.fn.expand(vim.fn.stdpath("data") .. "/sessions/"),
				})
			end,
		})
	end,
	config = {
		max_jobs = 16,
		compile_path = packer_util.join_paths(fn.stdpath("data"), "site", "lua", "packer_compiled.lua"),
	},
})

if is_installed then
	vim.cmd("PackerSync")
else
	local status, _ = pcall(require, "packer_compiled")
	if not status then
		local msg = "File packer_compiled.lua not found: run PackerSync to fix!"
		vim.notify(msg, vim.log.levels.ERROR, { title = "nvim-config" })
	end
end

api.nvim_create_autocmd({ "BufWritePost" }, {
	pattern = "*/plugins.lua",
	group = api.nvim_create_augroup("packer_auto_compile", { clear = true }),
	callback = function(ctx)
		local cmd = "source " .. ctx.file
		vim.cmd(cmd)
		vim.cmd("PackerCompile")
		vim.cmd("PackerSync")
		vim.notify("Sync and compile done!", vim.log.levels.INFO, { title = "nvim-config" })
	end,
})
