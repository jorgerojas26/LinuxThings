let mapleader = " "
"set autochdir
set tags=./tags,tags;$HOME
set visualbell
set nu rnu
set title
set titleold=
set titlestring=%{fnamemodify(getcwd(),\":t\")}\ \-\ NVIM
set noerrorbells
set scrolloff=8
set mps+=<:> " use % to jump between pairs
set showmatch
set hidden
set noshowmode
set nohlsearch
set incsearch
set ignorecase
set smartcase
set listchars=tab:▸\ ,eol:¬
set completeopt=menu,menuone,noinsert
set updatetime=300
set shortmess+=c
set exrc
set guicursor=
set tabstop=4 softtabstop=4
set shiftwidth=4
set undofile
set nowrap
set noswapfile
set cmdheight=1

if has("nvim-0.5.0") || has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif
" set colorcolumn=120
set termguicolors
colorscheme gruvbox

highlight Normal guibg=none

highlight Pmenu ctermbg=none guibg=Grey35 
highlight PmenuThumb ctermbg=none guibg=gray
set pumblend=20

"augroup FormatAutogroup
  "autocmd!
  "autocmd BufWritePost *.js,*.rs,*.vue FormatWrite
"augroup END

let g:UltiSnipsExpandTrigger="<NUL>"

