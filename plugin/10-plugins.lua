require("packer").startup(function(use)
  use({
    "glacambre/firenvim",
    run = function()
      vim.fn["firenvim#install"](0)
    end,
  })
  use("christoomey/vim-tmux-navigator")
  use("lewis6991/impatient.nvim")
  --use({ "github/copilot.vim" })
  use("wbthomason/packer.nvim")
  use("kyazdani42/nvim-web-devicons")
  -- use({ "rcarriga/nvim-notify" })
  use({ "SmiteshP/nvim-navic", requires = "neovim/nvim-lspconfig" })
  --use 'wakatime/vim-wakatime'
  use({ "nathom/filetype.nvim" })
  use({ "dhruvasagar/vim-buffer-history" })
  use({
    "max397574/better-escape.nvim",
    config = function()
      require("better_escape").setup({
        mapping = { "jk", "kj" }, -- a table with mappings to use
        timeout = vim.o.timeoutlen, -- the time in which the keys must be hit in ms. Use option timeoutlen by default
        clear_empty_lines = false, -- clear line after escaping if there is only whitespace
        keys = "<Esc>", -- keys used for escaping, if it is a function will use the result everytime
        -- example
        -- keys = function()
        --   return vim.fn.col '.' - 2 >= 1 and '<esc>l' or '<esc>'
        -- end,
      })
    end,
  })
  use({
    "mvllow/modes.nvim",
    config = function()
      vim.opt.cursorline = true
      require("modes").setup()
    end,
  })
  -- use({ "monaqa/dial.nvim" })
  --[[ use({
        "folke/trouble.nvim",
        requires = "kyazdani42/nvim-web-devicons",
        config = function()
            require("trouble").setup({
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            })
        end,
    }) ]]
  --[[ use { 'hoschi/yode-nvim', config = function()
            require('yode-nvim').setup({})
        end } ]]
  use("RRethy/vim-illuminate")
  --use { 'j-hui/fidget.nvim', config = function() require"fidget".setup{} end }
  -- use { 'chrisbra/NrrwRgn' }
  --use { 'camspiers/lens.vim', requires = 'camspiers/animate.vim' }
  --use { "beauwilliams/focus.nvim", config = function() require("focus").setup() end }
  -- use {'wfxr/minimap.vim', run = "cargo install --locked code-minimap", requires = {'wfxr/code-minimap'}}

  -- EDIT REMOTE FILES --
  --[[ use {
            'chipsenkbeil/distant.nvim',
            config = function()
                require('distant').setup {
                    -- Applies Chip's personal settings to every machine you connect to
                    --
                    -- 1. Ensures that distant servers terminate with no connections
                    -- 2. Provides navigation bindings for remote directories
                    -- 3. Provides keybinding to jump into a remote file's parent directory
                    ['*'] = require('distant.settings').chip_default()
                }
            end
        } ]]

  -- THEME --
  use("folke/tokyonight.nvim")

  -- TREE --
  -- use 'kyazdani42/nvim-tree.lua'
  --use({ "tamago324/lir.nvim" })
  -- use("elihunter173/dirbuf.nvim")
  --use("tpope/vim-vinegar")
  -- MOTION --
  -- use("phaazon/hop.nvim")
  use({
    "ggandor/leap.nvim",
    config = function()
      require("leap").add_default_mappings()
    end,
  })
  use({
    "andymass/vim-matchup",
    setup = function()
      -- may set any options here
      vim.g.matchup_matchparen_offscreen = { method = "popup" }
    end,
  })
  use("rhysd/clever-f.vim")

  -- TELESCOPE --
  -- use { "nvim-telescope/telescope-file-browser.nvim" }

  --use { "nvim-telescope/telescope-arecibo.nvim", rocks = {"openssl", "lua-http-parser"} }
  --use { "nvim-telescope/telescope-frecency.nvim", requires = {"tami5/sqlite.lua"} }
  --use { 'nvim-telescope/telescope-smart-history.nvim', requires = {'tami5/sqlite.lua'} }
  use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
  -- use "natecraddock/telescope-zf-native.nvim"
  use({ "nvim-telescope/telescope.nvim", requires = { "nvim-lua/plenary.nvim" } })
  use({ "nvim-telescope/telescope-project.nvim", requires = "nvim-telescope/telescope-live-grep-raw.nvim" })

  --use 'fannheyward/telescope-coc.nvim'

  -- TREESITTER --
  use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
  use("windwp/nvim-ts-autotag")
  use("windwp/nvim-autopairs")

  -- BUILT IN LSP --
  --use 'ray-x/lsp_signature.nvim'
  use("neovim/nvim-lspconfig")
  use("onsails/lspkind-nvim")
  use("williamboman/nvim-lsp-installer")
  -- use({ "jose-elias-alvarez/nvim-lsp-ts-utils" })
  --use {'neoclide/coc.nvim', branch = 'master', run = 'yarn install --frozen-lockfile'}

  -- CODE COMPLETION --
  -- use { 'ms-jpq/coq_nvim' }
  -- use { 'ms-jpq/coq.artifacts' }
  use("hrsh7th/nvim-cmp")
  use("hrsh7th/cmp-nvim-lsp")
  use("hrsh7th/cmp-nvim-lsp-signature-help")
  use("hrsh7th/cmp-buffer")
  use("hrsh7th/cmp-path")
  use("hrsh7th/cmp-cmdline")
  -- use { 'hrsh7th/cmp-copilot' }
  -- use { 'zbirenbaum/copilot.lua', config = function()
  --     vim.defer_fn(function()
  --         require("copilot").setup()
  --     end, 100)
  -- end
  -- }
  -- use {
  --     "zbirenbaum/copilot-cmp",
  --     after = { "copilot.lua", "nvim-cmp" },
  -- }

  use({
    "petertriho/cmp-git",
    config = function()
      require("cmp_git").setup()
    end,
  })
  -- use 'quangnguyen30192/cmp-nvim-ultisnips'
  --use 'hrsh7th/cmp-nvim-lua'

  -- STATUS LINE --
  use("nvim-lualine/lualine.nvim")
  use("kdheepak/tabline.nvim")

  -- GIT --
  use("tpope/vim-fugitive")

  -- UTILITIES (VERY IMPORTANT)--
  use("dstein64/vim-startuptime")
  use({
    "AckslD/nvim-neoclip.lua",
    config = function()
      require("neoclip").setup()
    end,
  })
  use("stefandtw/quickfix-reflector.vim")
  use("airblade/vim-rooter")
  use("ThePrimeagen/harpoon")
  use("lukas-reineke/indent-blankline.nvim")
  -- use("honza/vim-snippets")
  --use 'mhinz/vim-startify'
  use("akinsho/toggleterm.nvim")
  use({ "goolord/alpha-nvim" })

  -- CODE FORMATTER --
  --use 'mhartington/formatter.nvim'
  use("jose-elias-alvarez/null-ls.nvim")

  -- PRISMA SYNTAX HIGHLIGHTING --
  --use 'pantharshit00/vim-prisma'

  -- SNIPPETS --
  -- use 'SirVer/ultisnips'
  use({
    "L3MON4D3/LuaSnip",
    tag = "v<CurrentMajor>.*",
    after = "nvim-cmp",
    config = function() end,
  })
  use({ "saadparwaiz1/cmp_luasnip" })
  use("rafamadriz/friendly-snippets")

  -- SHOW COLORS
  use({
    "norcalli/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup()
    end,
  })

  -- CODE COMMENTS --
  use({
    "folke/todo-comments.nvim",
    requires = "nvim-lua/plenary.nvim",
    config = function()
      require("todo-comments").setup()
    end,
  })

  --[[ use {
            'b3nj5m1n/kommentary',
            config = function ()
                require('kommentary.config').configure_language('javascript', {
                    single_line_comment_string = 'auto',
                    multi_line_comment_strings = 'auto',
                    hook_function = function()
                        require('ts_context_commentstring.internal').update_commentstring()
                    end,
                })
            end
        } ]]
  use({
    "numToStr/Comment.nvim",
    config = function()
      require("Comment").setup({
        ---@param ctx Ctx
        pre_hook = function(ctx)
          -- Only calculate commentstring for tsx filetypes
          if
            vim.bo.filetype == "typescriptreact"
            or vim.bo.filetype == "javascriptreact"
            or vim.bo.filetype == "javascript"
            or vim.bo.filetype == "typescript"
          then
            local U = require("Comment.utils")

            -- Detemine whether to use linewise or blockwise commentstring
            local type = ctx.ctype == U.ctype.line and "jsx_element" or "jsx_element"

            -- Determine the location where to calculate commentstring from
            local location = nil
            if ctx.ctype == U.ctype.block then
              location = require("ts_context_commentstring.utils").get_cursor_location()
            elseif ctx.cmotion == U.cmotion.v or ctx.cmotion == U.cmotion.V then
              location = require("ts_context_commentstring.utils").get_visual_start_location()
            end

            return require("ts_context_commentstring.internal").calculate_commentstring({
              key = type,
              location = location,
            })
          end
        end,
      })
    end,
  })
  use("JoosepAlviste/nvim-ts-context-commentstring")

  -- REST CLIENT --
  use({
    "NTBBloodbath/rest.nvim",
    config = function()
      require("rest-nvim").setup({
        -- Open request results in a horizontal split
        result_split_horizontal = false,
        -- Skip SSL verification, useful for unknown certificates
        skip_ssl_verification = false,
        -- Highlight request on run
        highlight = {
          enabled = true,
          timeout = 150,
        },
        result = {
          -- toggle showing URL, HTTP info, headers at top the of result window
          show_url = true,
          show_http_info = true,
          show_headers = true,
        },
        -- Jump to request line on run
        jump_to_request = false,
        env_file = ".env",
        custom_dynamic_variables = {},
      })
    end,
  })

  -- DAP
  --[[ use {'mfussenegger/nvim-dap'}
        use {'nvim-telescope/telescope-dap.nvim'}
        use {'theHamsta/nvim-dap-virtual-text'}
        use {'rcarriga/nvim-dap-ui',
        config = function()
            require('dapui').setup()
        end
    }
    use {'Pocco81/DAPInstall.nvim'} ]]
  -- use({
  --   "ggandor/flit.nvim",
  --   config = function()
  --     require("flit").setup()
  --   end,
  -- })

  use("desdic/telescope-rooter.nvim")
  use({
    "prichrd/netrw.nvim",
    config = function()
      require("netrw").setup({})
    end,
  })
  use("tpope/vim-vinegar")
  use({ "rcarriga/vim-ultest", requires = { "vim-test/vim-test" }, run = ":UpdateRemotePlugins" })
  use("vim-test/vim-test")
  use("nvim-neotest/neotest-vim-test")
  use({
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup()
    end,
  })
end, {
  config = {
    compile_path = vim.fn.stdpath("config") .. "/lua/packer_compiled.lua",
  },
})
