local luasnip = require("luasnip")

luasnip.filetype_extend("javascript", { "javascript", "javascriptreact" })
luasnip.filetype_extend("typescript", { "typescript", "typescriptreact" })

require("luasnip/loaders/from_vscode").lazy_load()
