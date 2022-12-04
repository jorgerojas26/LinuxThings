local actions = require("telescope.actions")
local previewers = require("telescope.previewers")

local new_maker = function(filepath, bufnr, opts)
  opts = opts or {}

  filepath = vim.fn.expand(filepath)
  vim.loop.fs_stat(filepath, function(_, stat)
    if not stat then
      return
    end
    if stat.size > 100000 then
      return
    else
      previewers.buffer_previewer_maker(filepath, bufnr, opts)
    end
  end)
end

require("telescope").setup({
  defaults = {
    mappings = {
      i = {
        ["<esc>"] = actions.close,
      },
    },
    buffer_previewer_maker = new_maker,
  },
})

require("telescope").load_extension("project")
--require'telescope'.load_extension('coc')
require("telescope").load_extension("neoclip")
-- require('telescope').load_extension('smart_history')
--require('telescope').load_extension("frecency")
-- require('telescope').load_extension("arecibo")
require("telescope").load_extension("fzf")
--require('telescope').load_extension('file_browser')
-- require("telescope").load_extension("zf-native")
