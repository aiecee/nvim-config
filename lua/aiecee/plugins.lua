local utils = require("aiecee.utils")

-- Automatically install packer
local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = vim.fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer... close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
	return
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
	augroup packer_user_config
		autocmd!
		autocmd BufWritePost plugins.lua source <afile> | PackerSync
	augroup end
]])

-- Use a protected call so we don't error out on first Use
local ok, packer = pcall(require, "packer")
if not ok then
	return
end

--Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

-- Install plugins
return packer.startup(function(use)
	-- Packer
	use("wbthomason/packer.nvim")

	-- Themes
	use({ "catppuccin/nvim", as = "catppuccin" })
	use({ "gruvbox-community/gruvbox", disable = true })

	-- Notify
	use("rcarriga/nvim-notify")

	-- Telescope
	use({
		"nvim-telescope/telescope.nvim",
		requires = { "nvim-lua/plenary.nvim" },
	})
	use("nvim-telescope/telescope-ui-select.nvim")
	use("nvim-telescope/telescope-hop.nvim")
	use("nvim-telescope/telescope-file-browser.nvim")

	use({ "ThePrimeagen/harpoon", requires = { "nvim-lua/plenary.nvim" } })

	use({"ThePrimeagen/git-worktree.nvim"})

	-- LSP
	-- use({
	-- 	"williamboman/nvim-lsp-installer",
	-- 	requires = { "neovim/nvim-lspconfig" },
	-- })
	use("neovim/nvim-lspconfig")
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-path")
	use("hrsh7th/cmp-cmdline")
	use("hrsh7th/nvim-cmp")
	if utils.is_windows() then
		use({
			"tzachar/cmp-tabnine",
			after = "nvim-cmp",
			run = "powershell ./install.ps1",
			requires = "hrsh7th/nvim-cmp",
		})
	else
		use({ "tzachar/cmp-tabnine", run = "./install.sh", requires = "hrsh7th/nvim-cmp" })
	end
	use("tami5/lspsaga.nvim")
	use({ "aiecee/nvim-lsp-notify", disable = true })
	use({
		"jose-elias-alvarez/null-ls.nvim",
		requires = { "nvim-lua/plenary.nvim" },
	})
	use("onsails/lspkind-nvim")

	-- Rust tools
	use("simrat39/rust-tools.nvim")

	-- Treesitter
	use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
	use("nvim-treesitter/nvim-treesitter-refactor")
	use("folke/twilight.nvim")

	-- Zen Mode
	use("folke/zen-mode.nvim")

	-- Snippets
	use("hrsh7th/cmp-vsnip")
	use("hrsh7th/vim-vsnip")
	use("hrsh7th/vim-vsnip-integ")
	use("rafamadriz/friendly-snippets")

	-- Code Helpers
	use("windwp/nvim-autopairs")
	-- use("sbdchd/neoformat")
	-- use("mhartington/formatter.nvim")

	-- Nvim-Tree
	-- use({ "kyazdani42/nvim-tree.lua", requires = { "kyazdani42/nvim-web-devicons" } })

	-- neo-tree
	use("MunifTanjim/nui.nvim")
	use("nvim-neo-tree/neo-tree.nvim", {
		branch = "v2.x",
		requires = { "nvim-lua/plenary.nvim", "kyazdani42/nvim-web-devicons" },
	})

	-- Feline
	use({
		"feline-nvim/feline.nvim",
		requires = { "kyazdani42/nvim-web-devicons" },
	})

	-- Which-key
	use("folke/which-key.nvim")

	-- Hop
	use("phaazon/hop.nvim")

	-- Indent Blankline
	use("lukas-reineke/indent-blankline.nvim")

	-- Comments
	use("numToStr/Comment.nvim")
	use("folke/todo-comments.nvim")

	-- neogit
	use({ "TimUntersberger/neogit", requires = "nvim-lua/plenary.nvim" })

	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
