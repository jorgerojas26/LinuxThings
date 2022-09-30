local options = vim.o
local global = vim.g
local cmd = vim.cmd

global.loaded_matchit = 1
global.matchup_matchparen_enabled = 0
global.mapleader = " "
vim.cmd([[
let g:coq_settings = { 'auto_start': v:true }
]])

global.UltiSnipsJumpForwardTrigger = "<c-l>"
global.UltiSnipsJumpBackwardTrigger = "<c-h>"
global.UltiSnipsListSnippets = "<c-x><c-s>"
global.UltiSnipsRemoveSelectModeMappings = 0
global.UltiSnipsEnableSnipMate = 0

global.minimap_auto_start = 1
global.minimap_auto_start_win_enter = 1
global.ff = "unix"
global.dap_virtual_text = true
global.did_load_filetypes = 1

options.nu = true
--options.filetype = true
options.showtabline = 2
options.ff = "unix"
options.rnu = true
options.scrolloff = 8
options.hidden = true

options.errorbells = false
global.autoread = true
options.autoread = true
options.showmatch = true
options.showmode = false
options.hlsearch = false
options.smartcase = true
options.ignorecase = true
options.updatetime = 300
options.undofile = true
options.wrap = false
options.swapfile = false
options.clipboard = "unnamedplus"
options.signcolumn = "number"
options.termguicolors = true
options.backup = false
options.writebackup = false
options.shortmess = options.shortmess .. "c"
options.expandtab = true
options.shiftwidth = 4
options.softtabstop = 4
options.copyindent = true
options.fsync = false
options.title = true
--options.foldmethod = 'expr'
--options.foldexpr = 'nvim_treesitter#foldexpr()'

vim.cmd([[
    augroup FormatAutogroup
      autocmd!
      autocmd BufWritePre *.html,*.lua,*.js,*.ts,*.tsx,*.vue,*.json,*.http,*.prisma,*.css lua vim.lsp.buf.formatting_sync()
    augroup END
]])

vim.cmd([[
    let s:clip = '/mnt/c/Windows/System32/clip.exe' 
    if executable(s:clip)
        augroup WSLYank
            autocmd!
            autocmd TextYankPost * call system('echo '.shellescape(join(v:event.regcontents, "\<CR>")).' | '.s:clip)
        augroup END
    end
]])

vim.cmd([[
augroup highlight_yank
autocmd!
au TextYankPost * silent! lua vim.highlight.on_yank({higroup="Visual", timeout=200})
augroup END
]])

vim.cmd([[colorscheme tokyonight-night]])

--vim.opt.rtp:append({vim.fn.stdpath('data') .. "/site/pack/packer/start/vim-snippets"})

vim.cmd([[
function ChangeTitle()
    lua vim.o.titlestring = vim.fn.fnamemodify(vim.loop.cwd(), ':t')
endfunction

augroup SetTitle
    autocmd!
    autocmd BufWinEnter * call ChangeTitle()
    autocmd CursorHold * call ChangeTitle()
augroup END
]])

vim.cmd([[
autocmd BufRead,BufNewFile tsconfig.json set filetype=jsonc
]])
