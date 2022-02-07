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

	use({ "ThePrimeagen/harpoon", requires = { "nvim-lua/plenary.nvim" } })

	-- LSP
	use({
		"williamboman/nvim-lsp-installer",
		requires = { "neovim/nvim-lspconfig" },
	})
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-path")
	use("hrsh7th/cmp-cmdline")
	use("hrsh7th/nvim-cmp")
	use("tami5/lspsaga.nvim")
	use({ "aiecee/nvim-lsp-notify", disable = true })
	use({
		"jose-elias-alvarez/null-ls.nvim",
		requires = { "nvim-lua/plenary.nvim" },
		disable = true,
	})

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
	use("sbdchd/neoformat")

	-- Nvim-tree
	use({
		"kyazdani42/nvim-tree.lua",
		requires = { "kyazdani42/nvim-web-devicons" },
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

	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
