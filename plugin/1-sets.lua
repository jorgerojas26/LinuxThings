local options = vim.o
local global = vim.g
local cmd = vim.cmd

global.mapleader = ' '

global.tokyonight_style = 'night'

global.UltiSnipsJumpForwardTrigger = '<c-l>'
global.UltiSnipsJumpBackwardTrigger = '<c-h>'
global.UltiSnipsListSnippets = "<c-x><c-s>"
global.UltiSnipsRemoveSelectModeMappings = 0
global.UltiSnipsEnableSnipMate = 0

global.minimap_auto_start = 1
global.minimap_auto_start_win_enter = 1
global.ff = 'unix'
global.dap_virtual_text = true

options.nu = true
options.showtabline = 2
options.ff = 'unix'
options.rnu = true
options.scrolloff = 8
options.hidden = true
options.errorbells = false
options.showmatch = true
options.showmode = false
options.hlsearch = false
options.smartcase = true
options.ignorecase = true
options.updatetime = 300
options.undofile = true
options.wrap = false
options.swapfile = false
--options.clipboard = 'unnamedplus'
options.signcolumn = 'number'
options.termguicolors = true
options.backup = false
options.writebackup = false
options.shortmess = options.shortmess .. 'c'
options.expandtab = true
options.shiftwidth = 4
options.softtabstop = 4
options.copyindent = true
options.fsync = false
--options.foldmethod = 'expr'
--options.foldexpr = 'nvim_treesitter#foldexpr()'

vim.cmd([[
    augroup FormatAutogroup
      autocmd!
      autocmd BufWritePre *.html,*.lua,*.js,*.ts,*.tsx,*.vue,*.json,*.http lua vim.lsp.buf.formatting_sync()
    augroup END
]])

vim.cmd[[
    let s:clip = '/mnt/c/Windows/System32/clip.exe' 
    if executable(s:clip)
        augroup WSLYank
            autocmd!
            autocmd TextYankPost * call system('echo '.shellescape(join(v:event.regcontents, "\<CR>")).' | '.s:clip)
        augroup END
    end
]]

vim.cmd([[colorscheme tokyonight]])

--vim.opt.rtp:append({vim.fn.stdpath('data') .. "/site/pack/packer/start/vim-snippets"})
