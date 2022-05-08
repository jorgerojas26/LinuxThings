local cmp = require("cmp")
local lsp_installer = require("nvim-lsp-installer")

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
                ultisnips = "[snip]",
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
            -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
            vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
            -- require'snippy'.expand_snippet(args.body) -- For `snippy` users.
        end,
    },
    mapping = cmp.mapping.preset.insert(
        {
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
                elseif vim.fn["UltiSnips#CanJumpForwards"]() == 1 then
                    press("<ESC>:call UltiSnips#JumpForwards()<CR>")
                elseif has_any_words_before() then
                    press("<Tab>")
                else
                    fallback()
                end
            end, {
                    "i",
                    "s",
                }),
            ["<S-Tab>"] = cmp.mapping(function(fallback)
                if cmp.visible() then
                    cmp.select_prev_item()
                elseif vim.fn["UltiSnips#CanJumpBackwards"]() == 1 then
                    press("<ESC>:call UltiSnips#JumpBackwards()<CR>")
                else
                    fallback()
                end
            end, {
                    "i",
                    "s",
                }),
        }
    ),
    sources = cmp.config.sources({
        { name = "nvim_lsp"},
        -- { name = "copilot"},
        { name = "path"},
        { name = "buffer"},
        { name = "ultisnips"}
        --[[ --,
        { name = "nvim_lua", max_item_count = 10}, ]]
        --{ name = "cmp_tabnine", max_item_count = 10 },
        --{ name = 'orgmode'}
    }),

    -- view = {
    --     entries = 'native'
    -- }
    --[[ sorting = {
    comparators = {
      cmp.config.compare.offset,
      cmp.config.compare.exact,
      cmp.config.compare.score,

      -- copied from cmp-under, but I don't think I need the plugin for this.
      -- I might add some more of my own.
      function(entry1, entry2)
        local _, entry1_under = entry1.completion_item.label:find "^_+"
        local _, entry2_under = entry2.completion_item.label:find "^_+"
        entry1_under = entry1_under or 0
        entry2_under = entry2_under or 0
        if entry1_under > entry2_under then
          return false
        elseif entry1_under < entry2_under then
          return true
        end
      end,

      cmp.config.compare.kind,
      cmp.config.compare.sort_text,
      cmp.config.compare.length,
      cmp.config.compare.order,
    },
  }, ]]
})

cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
      { name = 'git' }, -- You can specify the `cmp_git` source if you were installed it.
    }, {
      { name = 'buffer' },
    })
  })

cmp.setup.cmdline('/', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })

--[[ local tabnine = require('cmp_tabnine.config')

tabnine:setup({
        max_lines = 1000;
        max_num_results = 20;
        sort = true;
	run_on_every_keystroke = true;
	snippet_placeholder = '..';
}) ]]

local nvim_cmp_capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())





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
    fileMatch = { ".prettierrc", "prettier.config", },
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
    fileMatch = { ".stylelintrc", "stylelint.config", },
    url = "http://json.schemastore.org/stylelintrc",
  },
  {
    fileMatch = { "manifest.json" },
    url = "https://json.schemastore.org/webextension.json",
  },

}

local function organize_imports()
  local params = {
    command = "_typescript.organizeImports",
    arguments = {vim.api.nvim_buf_get_name(0)},
    title = ""
  }
  vim.lsp.buf.execute_command(params)
end

lsp_installer.on_server_ready(function(server)
    local opts = {}
    local is_efm = server.name == 'efm'

    opts.capabilities = nvim_cmp_capabilities
    opts.root_dir = require("lspconfig").util.root_pattern("package.json", ".git", "init.lua")
    opts.on_attach = function(client)
      require("illuminate").on_attach(client)
      client.resolved_capabilities.document_formatting = is_efm
    end

    if server.name == 'jsonls' then
        opts.filetypes = {"json", "jsonc", "prettierrc"}
        opts.settings = { json = { schemas = json_schemas } }
    elseif server.name == 'tsserver' then
        opts.on_attach = function(client)
        local ts_utils = require("nvim-lsp-ts-utils")
            require("illuminate").on_attach(client)
            client.resolved_capabilities.document_formatting = is_efm
            ts_utils.setup({})
            ts_utils.setup_client(client)
        end
    elseif server.name == 'cssmodules_ls' then
        opts.on_attach = function(client)
            client.resolved_capabilities.document_formatting = is_efm
            client.resolved_capabilities.goto_definition = false
        end
        opts.init_options = {
            camelCase = 'dashes',
            hitName = 'cssmodules'
        }
    elseif server.name == 'prismals' then
        opts.on_attach = function(client)
            client.resolved_capabilities.document_formatting = true
        end
    elseif server.name == "efm" then
        opts.root_dir = require("lspconfig").util.root_pattern("package.json", ".git", "init.lua")
        opts.filetypes = vim.tbl_keys(languages)
        opts.init_options = { documentFormatting = true }
        opts.settings = { languages = languages }
    end
    server:setup(opts)
end)

require("null-ls").setup({
    sources = {
        --require('null-ls').builtins.formatting.stylua,
        require("null-ls").builtins.formatting.prettierd.with({
          filetypes = {"html", "typescriptreact", "javascriptreact", "css", "scss", "vue", "markdown", "jsonc", "json", "yaml", "typescript", "javascript", "module.css", "svg"}
        })
    },

})

