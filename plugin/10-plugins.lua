require'packer'.startup(function(use)
    use 'lewis6991/impatient.nvim'
    use 'wbthomason/packer.nvim'
    use 'kyazdani42/nvim-web-devicons'
    use 'dstein64/vim-startuptime'
    use { "AckslD/nvim-neoclip.lua", config = function() require('neoclip').setup() end }
    use 'stefandtw/quickfix-reflector.vim'
    use {
        "folke/trouble.nvim",
        requires = "kyazdani42/nvim-web-devicons",
        config = function()
            require("trouble").setup {
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            }
        end
    }
    use { 'hoschi/yode-nvim', config = function()
        require('yode-nvim').setup({})
    end }
    use 'RRethy/vim-illuminate'
    --use { 'j-hui/fidget.nvim', config = function() require"fidget".setup{} end }
    use { 'chrisbra/NrrwRgn' }
    --use { 'camspiers/lens.vim', requires = 'camspiers/animate.vim' }
    --use { "beauwilliams/focus.nvim", config = function() require("focus").setup() end }
    use {'norcalli/nvim-colorizer.lua', config = function ()
      require('colorizer').setup()
    end}
    -- use {'wfxr/minimap.vim', run = "cargo install --locked code-minimap", requires = {'wfxr/code-minimap'}}

    -- EDIT REMOTE FILES --
    use {
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
    }

    -- THEME --
    use 'folke/tokyonight.nvim'

    -- TREE --
    use 'kyazdani42/nvim-tree.lua'

    -- MOTION --
    use 'phaazon/hop.nvim'
    use 'andymass/vim-matchup'
    use 'rhysd/clever-f.vim'

    -- TELESCOPE --
    --use { "nvim-telescope/telescope-arecibo.nvim", rocks = {"openssl", "lua-http-parser"} }
    --use { "nvim-telescope/telescope-frecency.nvim", requires = {"tami5/sqlite.lua"} }
    use { 'nvim-telescope/telescope-smart-history.nvim', requires = {'tami5/sqlite.lua'} }
    -- use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
    use "natecraddock/telescope-zf-native.nvim"
    use {'nvim-telescope/telescope.nvim', requires =  {'nvim-lua/plenary.nvim'} }
    use {'nvim-telescope/telescope-project.nvim', requires = 'nvim-telescope/telescope-live-grep-raw.nvim'}

    --use 'fannheyward/telescope-coc.nvim'

    -- TREESITTER --
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
    use 'windwp/nvim-ts-autotag'
    use 'windwp/nvim-autopairs'

    -- BUILT IN LSP --
    --use 'ray-x/lsp_signature.nvim'
    use 'neovim/nvim-lspconfig'
    use 'onsails/lspkind-nvim'
    use 'williamboman/nvim-lsp-installer'
    --use { 'jose-elias-alvarez/nvim-lsp-ts-utils' }
    --use {'neoclide/coc.nvim', branch = 'master', run = 'yarn install --frozen-lockfile'}

    -- CODE COMPLETION --
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-nvim-lua'
    use 'hrsh7th/cmp-nvim-lsp'
    --use {'tzachar/cmp-tabnine', run='./install.sh', requires = 'hrsh7th/nvim-cmp'}
    use 'quangnguyen30192/cmp-nvim-ultisnips'

    -- STATUS LINE --
    use 'nvim-lualine/lualine.nvim'
    use 'kdheepak/tabline.nvim'

    -- GIT --
    use 'tpope/vim-fugitive'

    -- UTILITIES (VERY IMPORTANT)--
    use 'airblade/vim-rooter'
    use 'ThePrimeagen/harpoon'
    use 'lukas-reineke/indent-blankline.nvim'
    use 'honza/vim-snippets'
    --use 'mhinz/vim-startify'
    use 'akinsho/toggleterm.nvim'
    use {
        'goolord/alpha-nvim',
        config = function ()
            require'alpha'.setup(require'alpha.themes.startify'.opts)
        end
    }

    -- CODE FORMATTER --
    --use 'mhartington/formatter.nvim'
    use 'jose-elias-alvarez/null-ls.nvim'

    -- PRISMA SYNTAX HIGHLIGHTING --
    --use 'pantharshit00/vim-prisma'

    -- SNIPPETS --
    use 'SirVer/ultisnips'

    -- CODE COMMENTS --
    use {
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
    }
    use 'JoosepAlviste/nvim-ts-context-commentstring'

    -- REST CLIENT --
    use {
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
          env_file = '.env',
          custom_dynamic_variables = {},
        })
      end
    }

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




end,
{
    config = {
        compile_path = vim.fn.stdpath('config')..'/lua/packer_compiled.lua'
    }
}
)
