local function map(mode, shortcut, command)
  vim.api.nvim_set_keymap(mode, shortcut, command, { noremap = true, silent = true })
end

local function remap(mode, shortcut, command)
  vim.api.nvim_set_keymap(mode, shortcut, command, { silent = true })
end

local function nmap(shortcut, command)
  map("n", shortcut, command)
end

local function nremap(shortcut, command)
  remap("n", shortcut, command)
end

local function imap(shortcut, command)
  map("i", shortcut, command)
end

local function vmap(shortcut, command)
  map("v", shortcut, command)
end

local function tmap(shortcut, command)
  map("t", shortcut, command)
end

-- UTILITIES --
nmap("<leader>fs", ":w<CR>")
nmap("<leader>fq", ":q<CR>")
nmap("<leader>l", ":b#<CR>")
nmap("<C-Right>", ":vertical resize -5<CR>")
nmap("<C-Left>", ":vertical resize +5<CR>")
nmap("<C-Up>", ":resize +5<CR>")
nmap("<C-Down>", ":resize -5<CR>")
nmap("<leader>cc", ":'<,'>w !clip.exe<CR>")
vmap("J", ":m '>+1<CR>gv=gv")
vmap("K", ":m '>-2<CR>gv=gv")
--[[ imap('jk', '<Esc>')
imap('kj', '<Esc>') ]]

-- TELESCOPE --
nmap("gd", ":Telescope lsp_definitions<CR>")
nmap("gi", ":Telescope lsp_implementations<CR>")
nmap("gr", ":Telescope lsp_references theme=dropdown<CR>")
nmap("<leader>rn", ":lua vim.lsp.buf.rename()<CR>")
nmap("K", ":lua vim.lsp.buf.hover()<CR>")
-- nmap("<S-K>", ":lua vim.lsp.buf.signature_help()<CR>")
nmap("<leader>dd", ":lua vim.diagnostic.open_float()<CR>")
nmap("<leader>ca", ":lua vim.lsp.buf.code_action()<CR>")
nmap("<leader>ff", ':Telescope find_files path_display={"truncate"}<CR>')
nmap("<leader>pf", ":Telescope git_files theme=dropdown previewer=false hidden=true no_ignore=true<CR>")
nmap("<leader>fh", ":Telescope oldfiles theme=dropdown previewer=false <CR>")
--nmap('<leader>fw','<cmd>lua require("telescope").extensions.arecibo.websearch()  <CR>')
nmap("<leader>fl", ":Telescope resume <CR>")
-- nmap('<leader>ft',':Telescope file_browser<CR>')
nmap("<leader>fg", ":Telescope live_grep<CR>")
nmap("<leader>fc", ":Telescope grep_string<CR>")
nmap("<leader>fj", ":Telescope jumplist<CR>")
nmap("<leader>km", ":Telescope keymaps previewer=false<CR>")
nmap("<leader>js", ":Telescope lsp_document_symbols<CR>")
nmap("<leader>jS", ":Telescope lsp_dynamic_workspace_symbols<CR>")
nmap("<leader>bb", ":Telescope buffers<CR>")
nmap("<leader>rh", ":Telescope registers<CR>")
nmap("?", ":Telescope current_buffer_fuzzy_find previewer=false<CR>")
nmap("<leader>gd", ":Telescope git_bcommits theme=dropdown<CR>")
nmap("<leader>gc", ":Telescope git_commits theme=dropdown<CR>")
nmap("<leader>gb", ":Telescope git_branches theme=dropdown<CR>")
nmap("<leader>jt", ":Telescope treesitter<CR>")
nmap("<leader>pl", ":Telescope project theme=dropdown<CR>")
nmap("<c-p>", ":Telescope neoclip theme=dropdown <CR>")
imap("<c-p>", "<cmd>Telescope neoclip theme=dropdown <CR>")
nmap("<leader>td", ":TodoTelescope<CR>")

-- TREE --
nmap("<leader>ft", ':lua require("lir.float").toggle()<CR>')

-- MAP ESCAPE TO GO BACK TO NORMAL MODE IN TERMINAL --

tmap("<Esc>", "<C-\\><C-n>")

-- TOGGLETERM --
nmap("<F3>", ":ToggleTermToggleAll<CR>")

-- HOP --
-- nmap('<leader>jw',':HopWord<CR>')
-- nmap('<leader>jp',':HopPattern<CR>')
-- nmap('<leader>jl',':HopLineStart<CR>')
-- nmap('s',':HopChar2<CR>')

-- FUGITIVE --
nmap("<leader>gs", ":vertical rightbelow G<CR>")
nmap("<leader>gf", ":diffget //2<CR>")
nmap("<leader>gl", ":diffget //3<CR>")
nmap("<leader>g-", ":G switch - <CR>")

-- HARPOON --
nmap("<leader>h", "<cmd>lua require'harpoon.ui'.toggle_quick_menu()<CR>")
nmap("<leader>ah", "<cmd>lua require'harpoon.mark'.add_file()<CR>")
nmap("<leader>u", "<cmd>lua require'harpoon.ui'.nav_file(1)<CR>")
nmap("<leader>i", "<cmd>lua require'harpoon.ui'.nav_file(2)<CR>")
nmap("<leader>o", "<cmd>lua require'harpoon.ui'.nav_file(3)<CR>")

-- REST CLIENT --
nremap("<leader>hr", "<Plug>RestNvim")

-- GITHUB COPILOT --
vim.cmd([[imap <silent><script><expr> <C-J> copilot#Accept("\<CR>")]])

-- DAP
--[[ nmap('<leader>dct', '<cmd>lua require("dap").continue()<CR>')
nmap('<leader>dsv', '<cmd>lua require("dap").step_over()<CR>')
nmap('<leader>dsi', '<cmd>lua require("dap").step_into()<CR>')
nmap('<leader>dso', '<cmd>lua require("dap").step_out()<CR>')
nmap('<leader>dtb', '<cmd>lua require("dap").toggle_breakpoint()<CR>')
nmap('<leader>dsc', '<cmd>lua require("dap.ui.variables").scopes()<CR>')
nmap('<leader>dhh', '<cmd>lua require("dap.ui.variables").hover()<CR>')
nmap('<leader>dhv', '<cmd>lua require("dap.ui.variables").visual_hover()<CR>')
nmap('<leader>duh', '<cmd>lua require("dap.ui.widgets").hover()<CR>')
nmap('<leader>duf', '<cmd>lua local widgets=require"dap.ui.widgets";widgets.centered_float(widgets.scopes)<CR>')
nmap('<leader>dsbr', '<cmd>lua require"dap".set_breakpoint(vim.fn.input("Breakpoint condition: "))<CR>')
nmap('<leader>dsbm', '<cmd>lua require"dap".set_breakpoint(nil, nil, vim.fn.input("Log point message: "))<CR>')
nmap('<leader>dro', '<cmd>lua require"dap".repl.open()<CR>')
nmap('<leader>drl', '<cmd>lua require"dap".repl.run_last()<CR>') ]]

-- DAP TELESCOPE
--[[ nmap('<leader>dcc', '<cmd>lua require"telescope".extensions.dap.commands{}<CR>')
nmap('<leader>dco', '<cmd>lua require"telescope".extensions.dap.configurations{}<CR>')
nmap('<leader>dlb', '<cmd>lua require"telescope".extensions.dap.list_breakpoints{}<CR>')
nmap('<leader>dv', '<cmd>lua require"telescope".extensions.dap.variables{}<CR>')
nmap('<leader>df', '<cmd>lua require"telescope".extensions.dap.frames{}<CR>') ]]

-- DAP UI
-- nmap('<leader>dui', '<cmd>lua require"dapui".toggle()<CR>')

-- YODE
-- vmap('<leader>yc', ':YodeCreateSeditorFloating<CR>')
-- nmap('<leader>yr', ':YodeCreateSeditorReplace<CR>')

-- TROUBLE
-- nmap("<leader>tt", ":TroubleToggle workspace_diagnostics<CR>")

-- COC --
--imap('<c-s>', vim.fn['coc#refresh']())
--nmap('gd', ':Telescope coc definitions<CR>')
--nmap('gr', ':Telescope coc references<CR>')
--nremap('[[','<Plug>(coc-diagnostic-prev)')
--nremap(']]','<Plug>(coc-diagnostic-next)')
--nremap('<leader>rn', '<Plug>(coc-rename)')
--nremap('<leader>ca', '<Plug>(coc-codeaction)')
