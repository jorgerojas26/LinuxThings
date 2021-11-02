filetype on
let mapleader = " "
" set autochdir
set tags=./tags,tags;$HOME
set relativenumber
set visualbell
set title
set titleold=
set titlestring=%{fnamemodify(getcwd(),\":t\")}\ \-\ NVIM
set noerrorbells
set encoding=utf-8
set scrolloff=8
" set mps+=<:> " use % to jump between pairs
set showmatch
set hidden
set noshowmode
set nohlsearch
set incsearch
set ignorecase
set smartcase
" set listchars=tab:▸\ ,eol:¬
set completeopt=menu,menuone,noinsert
set shortmess+=c
" set exrc
" set guicursor=
set guioptions-=R
set guioptions-=r
set guioptions-=l
set guioptions-=L
set tabstop=4 softtabstop=4
set shiftwidth=4
set undodir=~/.vim/undodir
set undofile
set nowrap
set noswapfile

set signcolumn=yes
set colorcolumn=120
set termguicolors
colorscheme gruvbox
set background=dark

highlight Normal guibg=none

augroup FormatAutogroup
  autocmd!
  autocmd BufWritePost *.js,*.rs,*.vue FormatWrite
augroup END

let g:clever_f_across_no_line = 1




