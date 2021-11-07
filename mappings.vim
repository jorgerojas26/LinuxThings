imap jk <Esc>
imap kj <Esc>
noremap 0 ^

nnoremap <leader>U :UndotreeShow<CR>
"nnoremap <leader>pv :Sex!<CR>
nnoremap <C-Right> :vertical resize -5<CR>
nnoremap <C-Left> :vertical resize +5<CR>
nnoremap <C-Up> :resize +5<CR>
nnoremap <C-Down> :resize -5<CR>


nnoremap <leader>fs :w<cr>
nnoremap <leader>l :b#<cr>


vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '>-2<CR>gv=gv


" TELESCOPE
nnoremap <leader>fk <cmd>Telescope keymaps<cr>
nnoremap <leader>pf <cmd>Telescope git_files<cr>
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fr <cmd>Telescope lsp_references<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>js <cmd>Telescope lsp_document_symbols<cr>
nnoremap <leader>bb <cmd>Telescope buffers<cr>
"nnoremap <leader>jt <cmd>Telescope current_buffer_tags<cr>
nnoremap <leader>rh <cmd>Telescope registers<cr>
nnoremap <leader>ps <cmd>Telescope current_buffer_fuzzy_find<cr>
" nnoremap <leader>ca <cmd>Telescope lsp_code_actions<cr>
" nnoremap <leader>gs <cmd>Telescope git_status<cr>
nnoremap <leader>gc <cmd>Telescope git_commits<cr>
nnoremap <leader>jt <cmd>Telescope coc document_symbols<cr>
nnoremap <leader>cd <cmd>Telescope coc diagnostics<cr>
nnoremap <leader>ss :Telescope session-lens search_session<cr>
"nnoremap gd <cmd>Telescope lsp_definitions<cr>
"nnoremap gi <cmd>Telescope lsp_implementations<cr>
nnoremap <silent>gr <cmd>Telescope coc references<cr>
nnoremap <silent>gi <cmd>Telescope coc implementations<cr>
nnoremap <leader>ca <cmd>Telescope coc file_code_actions<cr>
nnoremap <leader>pl <cmd>lua require'telescope'.extensions.project.project{}<cr>
nnoremap <leader>rn <cmd>lua vim.lsp.buf.rename()<CR>
" nnoremap <leader>K <cmd>lua vim.lsp.buf.hover()<CR>
" nnoremap <C-k> <cmd>lua vim.lsp.buf.signature_help()<CR>


" NVIM TREE
nnoremap <leader>t <cmd>CocCommand explorer<CR>
nnoremap <leader>r :NvimTreeRefresh<CR>

tnoremap <Esc> <C-\><C-n>
nnoremap <F3> <cmd>lua require'toggleterm'.toggle_all_terms()<CR>

" HOP
nnoremap <leader>jw :HopWord<CR>
nnoremap <leader>jp :HopPattern<CR>
nnoremap <leader>jl :HopLineStart<CR>

" FUGITIVE
nnoremap <leader>gs :G<CR>
nnoremap <leader>gf :diffget //2<CR>
nnoremap <leader>gl :diffget //3<CR>

" HARPOON
nnoremap <leader>h <cmd>:lua require("harpoon.ui").toggle_quick_menu()<CR>
nnoremap <leader>ah <cmd>:lua require("harpoon.mark").add_file()<CR>
nnoremap <C-h> <cmd>:lua require("harpoon.ui").nav_file(1)<CR>
nnoremap <C-j> <cmd>:lua require("harpoon.ui").nav_file(2)<CR>
nnoremap <C-k> <cmd>:lua require("harpoon.ui").nav_file(3)<CR>
nnoremap <C-l> <cmd>:lua require("harpoon.ui").nav_file(4)<CR>

