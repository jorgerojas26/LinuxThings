call plug#begin('~/.vim/plugged')
Plug 'kyazdani42/nvim-web-devicons' " for file icons
" Plug 'kyazdani42/nvim-tree.lua'

Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-project.nvim'
Plug 'gruvbox-community/gruvbox'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update

Plug 'windwp/nvim-ts-autotag'
Plug 'windwp/nvim-autopairs'
Plug 'nvim-lualine/lualine.nvim'
" Plug 'glepnir/dashboard-nvim'
Plug 'RishabhRD/nvim-lsputils'
Plug 'jose-elias-alvarez/nvim-lsp-ts-utils'
Plug 'windwp/nvim-ts-autotag'
Plug 'RishabhRD/popfix'

Plug 'williamboman/nvim-lsp-installer'
Plug 'honza/vim-snippets'
Plug 'mhartington/formatter.nvim'
Plug 'rmagatti/auto-session'

Plug 'rmagatti/session-lens'
Plug 'mhinz/vim-startify'
Plug 'akinsho/toggleterm.nvim'
Plug 'andymass/vim-matchup'
Plug 'kdheepak/tabline.nvim'
" Plug 'ludovicchabant/vim-gutentags'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'phaazon/hop.nvim'

" Plug 'unblevable/quick-scope'
Plug 'rhysd/clever-f.vim'

" GIT
" Plug 'TimUntersberger/neogit'
" Plug 'lewis6991/gitsigns.nvim'
Plug 'tpope/vim-fugitive'

Plug 'airblade/vim-rooter'
" Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'ThePrimeagen/harpoon'
Plug 'SirVer/ultisnips'

" LSP
" ----- COC.nvim ------------------------------
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'fannheyward/telescope-coc.nvim'

" ---------------------------------------------

" ---- BUILT IN LSP --------------------

" Plug 'neovim/nvim-lspconfig'
" Plug 'glepnir/lspsaga.nvim'
" Plug 'onsails/lspkind-nvim'
" Plug 'ms-jpq/coq_nvim'
" Plug 'ms-jpq/coq.artifacts', {'branch': 'artifacts'}

"Plug 'hrsh7th/nvim-cmp'
"Plug 'hrsh7th/cmp-buffer'
"Plug 'hrsh7th/cmp-path'
"Plug 'hrsh7th/cmp-nvim-lua'
"Plug 'hrsh7th/cmp-nvim-lsp'
"Plug 'tzachar/cmp-tabnine', { 'do': './install.sh' }
"Plug 'quangnguyen30192/cmp-nvim-ultisnips'
" ----------------------------------------



call plug#end()
