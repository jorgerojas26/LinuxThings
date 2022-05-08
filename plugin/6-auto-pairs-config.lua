local Rule = require('nvim-autopairs.rule')
local npairs = require("nvim-autopairs")
local cond = require('nvim-autopairs.conds')
--local cmp_autopairs = require('nvim-autopairs.completion.cmp')
--local cmp = require('cmp')

--cmp.event:on( 'confirm_done', cmp_autopairs.on_confirm_done({  map_char = { tex = '' } }))
--cmp_autopairs.lisp[#cmp_autopairs.lisp+1] = "racket"

npairs.setup({
    check_ts = true,
    ts_config = {
        lua = {'string'},-- it will not add a pair on that treesitter node
        javascript = {'template_string'},
        java = false,-- don't check treesitter on java
    }
})



