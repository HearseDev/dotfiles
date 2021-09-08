call plug#begin(stdpath('data') . '/plugged')
    " UI
    Plug 'hoob3rt/lualine.nvim'
    Plug 'akinsho/nvim-bufferline.lua'
    Plug 'mhinz/vim-startify' 
    Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
    Plug 'kyazdani42/nvim-tree.lua'
    " Functional
    Plug 'jiangmiao/auto-pairs'
    Plug 'preservim/nerdcommenter'
    Plug 'junegunn/rainbow_parentheses.vim'
    Plug 'dstein64/vim-startuptime'
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim'
    Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
    Plug 'TimUntersberger/neogit'
    Plug 'lewis6991/gitsigns.nvim'
    Plug 'voldikss/vim-floaterm'
    " LSP
    Plug 'neovim/nvim-lspconfig'
    Plug 'kabouzeid/nvim-lspinstall'
    Plug 'hrsh7th/nvim-compe'
    Plug 'hrsh7th/vim-vsnip'
    Plug 'hrsh7th/vim-vsnip-integ'
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
    Plug 'glepnir/lspsaga.nvim'
    Plug 'ray-x/lsp_signature.nvim' 
    " Icons
    Plug 'kyazdani42/nvim-web-devicons' 
call plug#end()
