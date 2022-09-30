local luasnip = require("luasnip")

luasnip.filetype_extend("javascript", { "react", "javascript" })
luasnip.filetype_extend("typescript", { "react-ts", "typescript" })

require("luasnip/loaders/from_vscode").lazy_load()
