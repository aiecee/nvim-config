let mapleader = " " 

call plug#begin('~/.vim/plugged')

" Colours/Themes
Plug 'catppuccin/nvim', {'as': 'catppuccin'}
Plug 'gruvbox-community/gruvbox'

" Notify
Plug 'rcarriga/nvim-notify'

" LSP
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/nvim-lsp-installer'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'tami5/lspsaga.nvim'
Plug 'aiecee/nvim-lsp-notify'
" Plug 'j-hui/fidget.nvim'

" Snippets
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'

" Code helpers
Plug 'windwp/nvim-autopairs'

" Prettier
Plug 'sbdchd/neoformat'

" Telescope
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

" Icons (for feline and nvim-tree)
Plug 'kyazdani42/nvim-web-devicons'

" Feline
Plug 'feline-nvim/feline.nvim'

" nvim-tree
Plug 'kyazdani42/nvim-tree.lua'

" Which key
Plug 'folke/which-key.nvim'

" Local plugins
" Plug '~/Programming/vim-plugs/nvim-lsp-notify'
call plug#end()

lua<< EOF
vim.notify = require('notify')
EOF

augroup fmt
	autocmd!
	autocmd BufWritePre * undojoin | Neoformat
augroup END
