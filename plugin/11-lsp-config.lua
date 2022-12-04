local cmp = require("cmp")
local luasnip = require("luasnip")
local lsp_installer = require("nvim-lsp-installer")
local lspconfig = require("lspconfig")

local press = function(key)
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), "n", true)
end

local has_any_words_before = function()
  if vim.api.nvim_buf_get_option(0, "buftype") == "prompt" then
    return false
  end
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

cmp.setup({
  formatting = {
    format = require("lspkind").cmp_format({
      with_text = true,
      menu = {
        nvim_lsp = "[LSP]",
        -- ultisnips = "[snip]",
        luasnip = "[snip]",
        buffer = "[Buffer]",
        nvim_lua = "[Lua]",
        cmp_tabnine = "[TN]",
        path = "[PATH]",
      },
    }),
  },
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  snippet = {
    expand = function(args)
      --vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
      require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
      -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
      -- require'snippy'.expand_snippet(args.body) -- For `snippy` users.
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ["<C-d>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-e>"] = cmp.mapping.close(),
    ["<c-space>"] = cmp.mapping.complete(),
    ["<CR>"] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Replace,
      select = false,
    }),
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      elseif has_any_words_before() then
        cmp.complete()
      else
        fallback()
      end
      -- if cmp.visible() then
      --   cmp.select_next_item()
      -- elseif vim.fn["UltiSnips#CanJumpForwards"]() == 1 then
      --   press("<ESC>:call UltiSnips#JumpForwards()<CR>")
      -- elseif has_any_words_before() then
      --   press("<Tab>")
      -- else
      --   fallback()
      -- end
    end, {
      "i",
      "s",
    }),
    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
      -- if cmp.visible() then
      --   cmp.select_prev_item()
      -- elseif vim.fn["UltiSnips#CanJumpBackwards"]() == 1 then
      --   press("<ESC>:call UltiSnips#JumpBackwards()<CR>")
      -- else
      --   fallback()
      -- end
    end, {
      "i",
      "s",
    }),
  }),
  sources = cmp.config.sources({
    { name = "nvim_lsp" },
    -- { name = "copilot"},
    { name = "path" },
    { name = "buffer" },
    -- { name = "ultisnips"}
    { name = "luasnip" },
    { name = "nvim_lsp_signature_help" },
    --[[ --,
        { name = "nvim_lua", max_item_count = 10}, ]]
    --{ name = "cmp_tabnine", max_item_count = 10 },
    --{ name = 'orgmode'}
  }),
})

cmp.setup.filetype("gitcommit", {
  sources = cmp.config.sources({
    { name = "git" }, -- You can specify the `cmp_git` source if you were installed it.
  }, {
    { name = "buffer" },
  }),
})

cmp.setup.cmdline("/", {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = "buffer" },
  },
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(":", {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = "path" },
  }, {
    { name = "cmdline" },
  }),
})

--[[ local tabnine = require('cmp_tabnine.config')

tabnine:setup({
        max_lines = 1000;
        max_num_results = 20;
        sort = true;
	run_on_every_keystroke = true;
	snippet_placeholder = '..';
}) ]]

local nvim_cmp_capabilities = require("cmp_nvim_lsp").default_capabilities()

local json_schemas = {
  {
    fileMatch = { "package.json" },
    url = "https://json.schemastore.org/package",
  },
  {
    fileMatch = { "jsconfig*.json" },
    url = "https://json.schemastore.org/jsconfig",
  },
  {
    fileMatch = { "tsconfig*.json" },
    url = "https://json.schemastore.org/tsconfig",
  },
  {
    fileMatch = { ".prettierrc", "prettier.config" },
    url = "https://json.schemastore.org/prettierrc",
  },
  {
    fileMatch = { ".eslintrc", ".eslintrc.json" },
    url = "https://json.schemastore.org/eslintrc",
  },
  {
    fileMatch = { ".babelrc", ".babelrc", "babel.config.json" },
    url = "https://json.schemastore.org/babelrc",
  },
  {
    fileMatch = { "lerna.json" },
    url = "https://json.schemastore.org/lerna",
  },
  {
    fileMatch = { "now", "vercel.json" },
    url = "https://json.schemastore.org/now",
  },
  {
    fileMatch = { ".stylelintrc", "stylelint.config" },
    url = "http://json.schemastore.org/stylelintrc",
  },
  {
    fileMatch = { "manifest.json" },
    url = "https://json.schemastore.org/webextension.json",
  },
}

lsp_installer.setup()

lspconfig.tsserver.setup({
  on_attach = function(client, bufnr)
    require("nvim-navic").attach(client, bufnr)
    require("illuminate").on_attach(client)
    client.server_capabilities.document_formatting = false
    print("hola from tsserver on_attach")
  end,
  init_options = {
    preferences = {
      allowIncompleteCompletions = true,
      includePackageJsonAutoImports = "on",
    },
  },
  capabilities = nvim_cmp_capabilities,
})

lspconfig.prismals.setup({
  on_attach = function(client)
    client.server_capabilities.document_formatting = true
  end,
  capabilities = nvim_cmp_capabilities,
})

--[[ lspconfig.cssmodules_ls.setup({
  on_attach = function(client)
    client.server_capabilities.document_formatting = false
    client.server_capabilities.goto_definition = false
  end,
  flags = {
    init_options = {
      camelCase = "dashes",
      hitName = "cssmodules",
    },
  },
  capabilities = nvim_cmp_capabilities,
}) ]]

lspconfig.jsonls.setup({
  filetypes = { "json", "jsonc", "prettierrc" },
  settings = { json = { schemas = json_schemas } },
  capabilities = nvim_cmp_capabilities,
})

require("null-ls").setup({
  sources = {
    require("null-ls").builtins.formatting.stylua,
    require("null-ls").builtins.formatting.rome,
    require("null-ls").builtins.diagnostics.eslint_d,
  },
})

vim.lsp.handlers["textDocument/publishDiagnostics"] = function() end
