local actions = require('telescope.actions')

require('telescope').setup{
    defaults = {
        mappings = {
            i = {
                ["<esc>"] = actions.close
            },
        },
        history = {
            path = '~/.local/share/nvim/databases/telescope_history.sqlite3',
            limit = 100,
        },
        file_ignore_patterns = { "node%_modules/.*", "%.chunk", "%.log", "tag", "%.git" },
    },
    extensions = {
        project = {
            theme = 'dropdown',
            previewer = false
        }
    }
}

require'telescope'.load_extension('project')
--require'telescope'.load_extension('coc')
require('telescope').load_extension('neoclip')
-- require('telescope').load_extension('smart_history')
--require('telescope').load_extension("frecency")
-- require('telescope').load_extension("arecibo")
require('telescope').load_extension('fzf')
--require('telescope').load_extension('file_browser')
-- require("telescope").load_extension("zf-native")

