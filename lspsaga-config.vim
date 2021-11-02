if exists('g:loaded_lspsaga') | finish | endif

lua << EOF
local saga = require 'lspsaga'
saga.init_lsp_saga{}
EOF

nnoremap <silent> <C-j> :Lspsaga diagnostic_jump_next<CR>
nnoremap <silent>K :Lspsaga hover_doc<CR>
inoremap <silent> <C-k> :Lspsaga signature_help<CR>
nnoremap <silent> gh :Lspsaga lsp_finder<CR>!
nnoremap <silent><leader>ca :Lspsaga code_action<CR>
