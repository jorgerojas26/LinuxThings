local options = vim.o
local global = vim.g
local cmd = vim.cmd

global["test#javascript#runner"] = "tap"
global["test#javascript#tap#file_pattern"] = ".test.ts"
global.ultest_deprecation_notice = 0

global.loaded_matchit = 1
global.mapleader = " "
-- vim.cmd([[
-- let g:coq_settings = { 'auto_start': v:true }
-- ]])

global.ff = "unix"
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
options.signcolumn = "yes:1"
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
      autocmd BufWritePre *.html,*.lua,*.js,*.ts,*.tsx,*.vue,*.json,*.http,*.prisma,*.css lua vim.lsp.buf.format()
    augroup END
]])

vim.cmd([[colorscheme tokyonight-night]])

--vim.opt.rtp:append({vim.fn.stdpath('data') .. "/site/pack/packer/start/vim-snippets"})

vim.cmd([[
autocmd BufRead,BufNewFile tsconfig.json set filetype=jsonc
]])

vim.cmd([[
autocmd BufRead,BufNewFile .env* set filetype=bash
]])
