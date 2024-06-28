local completion_config = require("aiecee.config.completion")
return {
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
			"hrsh7th/cmp-nvim-lsp-signature-help",
			"hrsh7th/cmp-nvim-lsp-document-symbol",
			"hrsh7th/cmp-nvim-lua",
			"hrsh7th/cmp-vsnip",
			"hrsh7th/vim-vsnip",
			"hrsh7th/vim-vsnip-integ",
			"rafamadriz/friendly-snippets",
			"onsails/lspkind-nvim",
			"lukas-reineke/cmp-under-comparator",
			"zbirenbaum/copilot.lua",
			"zbirenbaum/copilot-cmp",
		},
		event = "InsertEnter",
		config = completion_config,
	},
}
